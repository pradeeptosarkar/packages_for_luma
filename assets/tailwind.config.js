// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");
const fs = require("fs");
const path = require("path");

module.exports = {
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  theme: {
    theme: {
      screens: {
        sm: "640px",
        // => @media (min-width: 640px) { ... }

        md: "768px",
        // => @media (min-width: 768px) { ... }

        lg: "1024px",
        // => @media (min-width: 1024px) { ... }

        xl: "1280px",
        // => @media (min-width: 1280px) { ... }

        "2xl": "1536px",
        // => @media (min-width: 1536px) { ... }
      },
    },
    extend: {
      colors: {
        red: {
          light: "hsl(var(--red-light))",
          medium: "hsl(var(--red-medium))",
          DEFAULT: "hsl(var(--red))",
          vibrant: "hsl(var(--red-vibrant))",
          dark: "hsl(var(--red-dark))",
          darker: "hsl(var(--red-darker))",
        },
        blue: {
          light: "hsl(var(--blue-light))",
          dark: "hsl(var(--blue-dark))",
        },
        purple: "hsl(var(--purple))",
        white: "hsl(var(--white) / <alpha-value>)",
      },
    },
    plugins: [
      require("@tailwindcss/forms"),
      // Allows prefixing tailwind classes with LiveView classes to add rules
      // only when LiveView classes are applied, for example:
      //
      //     <div class="phx-click-loading:animate-ping">
      //
      plugin(({ addVariant }) =>
        addVariant("phx-no-feedback", [
          ".phx-no-feedback&",
          ".phx-no-feedback &",
        ])
      ),
      plugin(({ addVariant }) =>
        addVariant("phx-click-loading", [
          ".phx-click-loading&",
          ".phx-click-loading &",
        ])
      ),
      plugin(({ addVariant }) =>
        addVariant("phx-submit-loading", [
          ".phx-submit-loading&",
          ".phx-submit-loading &",
        ])
      ),
      plugin(({ addVariant }) =>
        addVariant("phx-change-loading", [
          ".phx-change-loading&",
          ".phx-change-loading &",
        ])
      ),

      // Embeds Heroicons (https://heroicons.com) into your app.css bundle
      // See your `CoreComponents.icon/1` for more information.
      //
      plugin(function ({ matchComponents, theme }) {
        let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized");
        let values = {};
        let icons = [
          ["", "/24/outline"],
          ["-solid", "/24/solid"],
          ["-mini", "/20/solid"],
        ];
        icons.forEach(([suffix, dir]) => {
          fs.readdirSync(path.join(iconsDir, dir)).map((file) => {
            let name = path.basename(file, ".svg") + suffix;
            values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
          });
        });
        matchComponents(
          {
            hero: ({ name, fullPath }) => {
              let content = fs
                .readFileSync(fullPath)
                .toString()
                .replace(/\r?\n|\r/g, "");
              return {
                [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
                "-webkit-mask": `var(--hero-${name})`,
                mask: `var(--hero-${name})`,
                "mask-repeat": "no-repeat",
                "background-color": "currentColor",
                "vertical-align": "middle",
                display: "inline-block",
                width: theme("spacing.5"),
                height: theme("spacing.5"),
              };
            },
          },
          { values }
        );
      }),
    ],
  },
};
