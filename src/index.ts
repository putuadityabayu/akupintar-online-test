import 'dotenv/config'
import modelInitialization from './models'
import app from './app'

const port = process.env.PORT||3000
async function main() {
    if(typeof process.env.JWT_SECRET !== "string") {
        console.error("Please add `JWT_SECRET` in .env")
        process.exit(1)
    }
    await modelInitialization()
    app.listen(process.env.PORT||3000,()=>{
        console.log(`Application listening on port ${port}`)
    })
}

main();