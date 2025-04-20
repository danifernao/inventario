# Guía

Aplicación web para la gestión de inventario elaborado con Laravel y Vue.js.

![Captura de pantalla de la aplicación web](/screenshot.png)

## Instalación y configuración

1. Asegúrate de tener instalado Docker y su servicio en ejecución.
2. Descarga o clona este repositorio e ingresa a él.
3. Renombra el archivo .env.example a .env.
4. Abre el archivo .env, ubícate en las líneas `RECAPTCHA_SITE_KEY` y `RECAPTCHA_SECRET_KEY` y escribe al lado las claves de tu reCAPTCHA:

```
RECAPTCHA_SITE_KEY=CLAVE_SITIO
RECAPTCHA_SECRETE_KEY=CLAVE_SECRETA
```

5. Abre el terminal y ejecuta lo siguiente para instalar y poner en marcha los contenedores:

```
docker compose up --watch --build
```

6. Abre el navegador web y visita la dirección `http://localhost/` para visualizar la aplicación.
7. Visita la dirección `http://localhost:8888/` para acceder a phpMyAdmin.
8. Visita la dirección `http://localhost:8025/` para acceder a MailHog.

## Credenciales

Correo electrónico: `admin@example.com`\
Contraseña: `admin@IWAPP#22`
