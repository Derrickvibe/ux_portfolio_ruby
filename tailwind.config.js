/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./source/**/*.{html,erb}"
  ],
  theme: {
    extend: {
      colors: {
        Black: '#09090A',
        white: '#ffffff',
        gray:'#999999',
        yellow: '#FFFF00'
      },    
      fontFamily: {
        'Lexend': ['Gilroy','system-ui','sans-serif'],
      },
      fontSize: {
        sm: ['14px', '20px'],
        base: ['16px', '24px'],
        lg: ['20px', '28px'],
        xl: ['24px', '32px'],
      }
    },
  },
  plugins: [],
}
