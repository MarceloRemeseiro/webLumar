# Astro Template with Tailwind CSS, Nginx, and Docker

Este proyecto es un template inicial para crear aplicaciones web utilizando Astro y Tailwind CSS, con un entorno de producción configurado para correr con Nginx y Docker.

## Tecnologías Incluidas

- **Astro**: Un framework de generación de sitios estáticos que permite construir sitios web rápidos y eficientes usando componentes modernos.
- **Tailwind CSS**: Un framework de CSS utility-first para un diseño rápido y responsive sin salir del HTML.
- **Nginx**: Un servidor web de alto rendimiento configurado para servir el contenido estático generado por Astro.
- **Docker**: Utilizado para contenerizar la aplicación y su entorno, permitiendo un deployment consistente y escalable.
- **Scripts de Deployment**: Scripts personalizados para facilitar el despliegue del sitio en cualquier entorno que soporte Docker.

## Estructura del Proyecto

```plaintext
/
├── src/                 # Directorio de fuentes de Astro y componentes
├── public/              # Archivos estáticos como imágenes y favicon
├── Dockerfile           # Dockerfile para construir el contenedor de Nginx
├── nginx/nginx.conf           # Configuración de Nginx para servir los archivos estáticos
└── README.md            # Documentación del proyecto
