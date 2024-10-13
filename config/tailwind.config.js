const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./app/components/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        montserrat: ["montserrat", "sans-serif"],
      },
      colors: {
        carnage: {
          main: "#141414ff",
          secondary: {
            DEFAULT: "#1e1e1eff",
            pressed: "#2d2d2dff",
          },
          red: {
            DEFAULT: "#ff5a5aff",
            pressed: "#ff6969ff",
          },
        },
      },
    },
    container: {
      center: true,
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
