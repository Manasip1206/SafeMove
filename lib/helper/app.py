from flask import Flask, request, jsonify
import numpy as np
import tensorflow as tf
import tensorflow_hub as hub
import cv2
import os

app = Flask(__name__)

# Load MoveNet model
model = hub.load("https://tfhub.dev/google/movenet/singlepose/thunder/4")
movenet = model.signatures['serving_default']

# Load your pose classification model here
# classifier = tf.keras.models.load_model("your_model.h5")

def detect_pose(image):
    image = tf.image.resize_with_pad(image, 256, 256)
    input_image = tf.expand_dims(image, axis=0)
    input_image = tf.cast(input_image, dtype=tf.int32)
    outputs = movenet(input_image)
    keypoints = outputs['output_0'].numpy()[0, 0, :, :2]
    return keypoints

def normalize_keypoints(kps):
    left_hip, right_hip = kps[11], kps[12]
    hip_dist = np.linalg.norm(left_hip - right_hip)
    hip_dist = hip_dist if hip_dist != 0 else 1e-6
    return kps / hip_dist

def calculate_angle(a, b, c):
    ba, bc = a - b, c - b
    cosine = np.dot(ba, bc) / (np.linalg.norm(ba) * np.linalg.norm(bc))
    return np.degrees(np.arccos(np.clip(cosine, -1.0, 1.0)))

def predict_pose_label(keypoints):
    # Replace with actual classifier prediction
    # flat = keypoints.flatten().reshape(1, -1)
    # prediction = classifier.predict(flat)
    # label = class_names[np.argmax(prediction)]
    return "padahastasana"  # Dummy label for demo

def pose_feedback(label, kps):
    if label == "padahastasana":
        lw, rw = kps[9], kps[10]
        la, ra = kps[15], kps[16]
        avg_dist = (np.linalg.norm(lw - la) + np.linalg.norm(rw - ra)) / 2
        if avg_dist > 0.12:
            return "Try to touch your feet!"
    elif label == "hasta_uttanasana":
        nose = kps[0]
        hip = (kps[11] + kps[12]) / 2
        knee = (kps[13] + kps[14]) / 2
        angle = calculate_angle(nose, hip, knee)
        if 170 < angle < 180:
            return "Lean back more!"
    elif label == "kumbhakasana":
        lh, lk, la = kps[11], kps[13], kps[15]
        rh, rk, ra = kps[12], kps[14], kps[16]
        angle = (calculate_angle(lh, lk, la) + calculate_angle(rh, rk, ra)) / 2
        if angle < 165:
            return "Don't bend your legs!"
    return "Good pose!"

@app.route("/predict", methods=["POST"])
def predict():
    if "image" not in request.files:
        return jsonify({"error": "No image uploaded"}), 400

    file = request.files["image"]
    image_bytes = np.frombuffer(file.read(), np.uint8)
    image = cv2.imdecode(image_bytes, cv2.IMREAD_COLOR)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = tf.convert_to_tensor(image, dtype=tf.uint8)

    keypoints = detect_pose(image)
    norm_keypoints = normalize_keypoints(keypoints)
    label = predict_pose_label(norm_keypoints)
    feedback = pose_feedback(label, norm_keypoints)

    return jsonify({
        "pose_label": label,
        "feedback": feedback,
        "keypoints": keypoints.tolist()
    })

if __name__ == "__main__":
    app.run(debug=True)