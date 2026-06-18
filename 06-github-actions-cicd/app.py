from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def home():
    hostname = socket.gethostname()
    return f"""
    <html>
      <head>
        <title>GitHub Actions CI/CD Lab</title>
      </head>
      <body>
        <h1>GitHub Actions CI/CD Lab</h1>
        <p>This Flask app is running inside a Docker container.</p>
        <p>Container hostname: {hostname}</p>
      </body>
    </html>
    """

@app.route("/health")
def health():
    return {"status": "healthy"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
