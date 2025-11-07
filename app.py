from flask import Flask, render_template, jsonify, request
import os

app = Flask(__name__, 
            template_folder='templates',   # ← SEKARANG BENAR!
            static_folder='static')

todos = []

@app.route('/')
def index():
    path = os.path.join(app.template_folder, 'index.html')
    print(f"[DEBUG] Template: {path}")
    print(f"[DEBUG] Exists: {os.path.exists(path)}")
    print(f"[DEBUG] Files: {os.listdir(app.template_folder)}")
    
    if not os.path.exists(path):
        return f"ERROR: index.html TIDAK ADA di {path}", 500
    
    return render_template('index.html')

@app.route('/todos', methods=['GET'])
def get_todos():
    return jsonify(todos)

@app.route('/todos', methods=['POST'])
def add_todo():
    task = request.json.get('task')
    if task:
        todos.append(task)
        return jsonify({'message': 'Todo added'}), 201
    return jsonify({'error': 'Task required'}), 400

@app.route('/todos/<int:i>', methods=['DELETE'])
def delete_todo(i):
    if 0 <= i < len(todos):
        del todos[i]
        return jsonify({'message': 'Todo deleted'})
    return jsonify({'error': 'Invalid index'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)