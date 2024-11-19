/** @type {import('tailwindcss').Config} */
export default {
  // Los archivos que Tailwind deberá escanear para determinar las clases que se están utilizando.
  // Asegúrate de actualizar estas rutas si agregas o mueves archivos.
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],

  // La sección de "theme" te permite personalizar los valores predeterminados de Tailwind.
  theme: {
    // Extend permite extender la configuración por defecto sin sobrescribir los valores originales.
    extend: {
      // Aquí puedes definir tus propios colores que serán agregados a la paleta de colores predeterminada.
      colors: {
        secundario: "#150a4a",
        primary: "#3c4e66",
        grisOscuro: "#252525",
        negro: "#000",
        blanco: "#fff",
      },

      // Personalizar las fuentes. Puedes añadir tu configuración de fuentes personalizadas aquí.
      fontFamily: {
        neuropol: ['Neuropol', 'sans-serif'],
        sans: ["Inter", "sans-serif"], // Define una fuente sans-serif personalizada.
        serif: ["Merriweather", "serif"], // Define una fuente serif personalizada.
      },

      // Espaciado personalizado. Útil para mantener un sistema de diseño consistente.
      spacing: {
        128: "32rem",
        144: "36rem",
      },

      // Configuración personalizada de breakpoints para media queries.
      screens: {
        "2xl": "1536px", // Puedes añadir o modificar los breakpoints aquí.
      },
    },
  },

  // Plugins adicionales que puedes instalar y utilizar con Tailwind.
  // Por ejemplo, @tailwindcss/forms para estilos de formularios mejorados.
  plugins: [
    // Aquí podrías importar otros plugins como forms, line-clamp, typography, etc.
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
  ],
};
