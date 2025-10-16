// app/server.js
import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  // res.json({
  //   message: "🚀 Mini Toolkit DevOps ativo e rodando na AWS EC2!",
  //   timestamp: new Date().toISOString(),
  // });
  res.send(`
    <!doctype html>
    <html lang="pt-BR">
    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width,initial-scale=1" />
      <title>Mini Formulário - Vanilla JS</title>
      <style>
        body { font-family: Arial, Helvetica, sans-serif; margin: 24px; }
        form { max-width: 420px; }
        label { font-weight: 600; margin-top: 8px; display:block; }
        input { padding: 8px; margin-top: 4px; width:100%; box-sizing:border-box; }
        button { padding: 8px 12px; margin-top: 12px; }
        pre { white-space: pre-wrap; word-break: break-word; }
      </style>
    </head>
    <body>
      <script>
        document.addEventListener('DOMContentLoaded', function() {
          // Container
          const container = document.createElement('div');

          const title = document.createElement('h1');
          title.textContent = 'Mini Formulário (Vanilla JS)';
          container.appendChild(title);

          // Form criado dinamicamente
          const form = document.createElement('form');
          form.id = 'miniForm';

          const fields = [
            { label: 'Nome', name: 'name', type: 'text', placeholder: 'Seu nome' },
            { label: 'Email', name: 'email', type: 'email', placeholder: 'seu@exemplo.com' }
          ];

          fields.forEach(f => {
            const lbl = document.createElement('label');
            lbl.textContent = f.label;
            const inp = document.createElement('input');
            inp.type = f.type;
            inp.name = f.name;
            inp.placeholder = f.placeholder;
            inp.required = true;
            form.appendChild(lbl);
            form.appendChild(inp);
          });

          const submit = document.createElement('button');
          submit.type = 'submit';
          submit.textContent = 'Enviar';
          form.appendChild(submit);

          const output = document.createElement('pre');
          output.id = 'output';
          output.style.display = 'none';
          output.style.background = '#f4f4f4';
          output.style.padding = '10px';
          output.style.marginTop = '12px';

          form.addEventListener('submit', function(e) {
            e.preventDefault();
            const data = Object.fromEntries(new FormData(form).entries());
            output.textContent = JSON.stringify(data, null, 2);
            output.style.display = 'block';
          });

          container.appendChild(form);
          container.appendChild(output);
          document.body.appendChild(container);
        });
      </script>
    </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`✅ Servidor rodando na porta ${PORT}`);
});

