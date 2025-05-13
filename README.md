# Sistema de información para la gestión de inventario

Aplicación web para la gestión de inventario elaborado con Laravel y Vue.js.

![Captura de pantalla de la aplicación web](/screenshot.png)

## Instalación y configuración

1. Asegúrate de tener instalado Docker y su servicio en ejecución.
2. Descarga o clona este repositorio e ingresa a él.
3. Renombra el archivo `.env.example` a `.env`.
4. Opcional. Abre el archivo `.env`, ubícate en las líneas `RECAPTCHA_SITE_KEY` y `RECAPTCHA_SECRET_KEY` y escribe al lado las claves de tu reCAPTCHA:

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

## Guía

### Conceptos

-   **Bodega**: Lugar físico donde se almacenan objetos.
-   **Unidad**: El objeto en sí. Cada unidad cuenta con un número de serie único.
-   **Producto**: Conjunto de características comunes que comparten varias unidades, como la marca y el modelo.
-   **Fabricante**: Entidad que produce las unidades de un producto.
-   **Proveedor**: Entidad que suministra las unidades a la empresa. Puede ser el mismo fabricante o un intermediario.
-   **Proyecto**: Destino final donde las unidades serán instaladas o utilizadas.

### Autenticación

Para acceder al sistema de información, se debe visitar la dirección `http://localhost/`, ingresar el correo y la contraseña provistos en el apartado _Credenciales_, verificar que no se es un robot y presionar el botón _Iniciar sesión_.

En caso de haber olvidado la contraseña, se puede hacer clic en el enlace _¿Olvidaste tu contraseña?_ y diligenciar los campos del formulario correspondiente. La aplicación enviará un correo electrónico a la dirección proporcionada, en el que se describen los pasos para cambiar la contraseña. Para consultar la bandeja de entrada, se debe visitar la dirección `http://localhost:8025/`.

### Navegación

La navegación en la aplicación se realiza a través de la barra superior, cuyo propósito es permitir el desplazamiento entre las dos secciones principales del sistema de información: _Inventario_ y _Proyectos_.

En _Inventario_ se gestionan los productos almacenados en las bodegas, mientras que en _Proyectos_ se gestionan los productos que están siendo utilizados por los clientes. Cuando se accede a la sección _Inventario_, se despliega un panel lateral a la izquierda. Los elementos de dicho panel solo aparecerán si existen bodegas registradas, por lo que este será el primer registro que solicitará la aplicación al ingresar por primera vez.

El inventario de cada bodega cuenta con tres opciones. La opción _Productos_ lista los productos almacenados en la bodega seleccionada. Al hacer clic en un producto, se listan las unidades disponibles de dicho producto en la bodega. A su vez, al hacer clic en una unidad específica, se listan los movimientos asociados a esta (por ejemplo, cuando una unidad pasa de una bodega a un proyecto o viceversa).

El comportamiento es similar con las opciones _Proveedores_ y _Fabricantes_, con la diferencia de que estas listan primero los proveedores y fabricantes que tienen productos en la bodega seleccionada. Al hacer clic en un proveedor o fabricante específico, se muestran los productos almacenados en la bodega que fueron provistos o fabricados por dicha entidad.

En la sección Proyectos se listan los proyectos registrados en los que participa la empresa. Al hacer clic en un proyecto, se muestran los productos destinados a este. A su vez, estos productos despliegan las unidades que han sido empleadas en el proyecto seleccionado.

### Filtrar Listado

Se debe tener en cuenta que, por defecto, la aplicación solo lista los proveedores, fabricantes y productos que tienen unidades asociadas en la bodega o proyecto seleccionado. Por lo tanto, si se desea visualizar los registros sin unidades en una bodega o proyecto, se debe hacer clic en el menú _Filtrar listado_ y seleccionar la opción correspondiente.

### Notificaciones

Cuando un producto no cuenta con unidades suficientes (el número mínimo de unidades es definido al momento de su registro), se generará una notificación en la campanita ubicada en la barra de navegación superior.

### Usuarios

La gestión de los usuarios se realiza en _Configuración > Usuarios_, accesible haciendo clic en el nombre del usuario autenticado, ubicado en la barra de navegación superior. Los usuarios pueden ser de dos tipos:

-   **Administrador:** Puede gestionar tanto a los usuarios como el inventario.
-   **Operador:** Puede gestionar el inventario, pero no tiene acceso a la gestión de usuarios.
