const API = '/todos';

async function loadTodos() {
    const res = await fetch(API);
    const todos = await res.json();
    const list = document.getElementById('todoList');
    list.innerHTML = '';
    todos.forEach((todo, i) => {
        const li = document.createElement('li');
        li.className = 'list-group-item d-flex justify-content-between';
        li.innerHTML = `<span ondblclick="edit(${i})">${todo}</span>
                        <button class="btn btn-sm btn-danger" onclick="del(${i})">Hapus</button>`;
        list.appendChild(li);
    });
}

async function addTodo() {
    const input = document.getElementById('newTask');
    const task = input.value.trim();
    if (!task) return;
    await fetch(API, { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({task}) });
    input.value = '';
    loadTodos();
}

function del(i) {
    fetch(`${API}/${i}`, { method: 'DELETE' }).then(loadTodos);
}

function edit(i) {
    const newText = prompt('Edit:', document.querySelectorAll('span')[i].textContent);
    if (newText) {
        // Update manual (API bisa ditambah PUT)
        document.querySelectorAll('span')[i].textContent = newText;
    }
}

loadTodos();