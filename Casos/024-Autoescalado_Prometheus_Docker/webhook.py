from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/')
def home():
    return "¡Flask está corriendo correctamente!", 200

@app.route('/webhook', methods=['GET', 'POST'])
def webhook():
    
    if not request.is_json:
        return jsonify({"error": "Se esperaba JSON"}), 415

    alert_data = request.get_json()
    print("🔔 Datos recibidos:", alert_data)
    container_name = "node_exporter"  # Cambia esto según tu contenedor

    if alert_data and 'alerts' in alert_data:
        for alert in alert_data['alerts']:
            if alert['status'] == "firing":
                subprocess.Popen(["/bin/bash", "./autoremediate.sh", container_name])

    return jsonify({"message": "Webhook recibido"}), 200
    


if __name__ == '__main__':
    app.run(host='172.27.164.211', port=5000, debug=True)
