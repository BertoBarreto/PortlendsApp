require('dotenv').config();
const app = require('./app');
app.listen(process.env.PORT, ()=>{
    console.log(`api is listenning on port ${process.env.PORT}`)
});

