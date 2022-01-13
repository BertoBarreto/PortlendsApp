require('dotenv').config();
const app = require('./app');
app.listen(process.env.PORT, ()=>{
    console.log(`api is litenning on port ${process.env.PORT}`)
});

