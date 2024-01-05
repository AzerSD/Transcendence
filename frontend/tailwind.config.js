/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}", "./public/index.html"],
  theme: {
    extend: {
      fontSize: {
        "1.5xl": "1.275rem",
      },
      fontFamily: {
        nosifer: ["Nosifer", "cursive"],
      },
      colors: {
        "purple-950-opacity": "rgba(99, 39, 120, 0.8)",
        "purple-700-opacity": "rgba(124, 58, 237, 0.7)",
        "purple-750-opacity": "rgba(134, 68, 245, 0.1)",
        "purple-950-opacity-welcome": "rgba(26, 24, 36, 0.8)",
        "purple-700-opacity-welcome": "rgba(99, 39, 120, 0.8)",
        "purple-750-opacity-welcome": "rgba(76, 41, 88, 0.9)",
      },
    },
  },
  plugins: [],
  corePlugins: {
    preflight: true,
    container: true,
  },
};
