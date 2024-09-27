// Make database data

// make images
import fs from 'fs'

function streamFile(file: string) {
  return new Promise((resolve): void => {
    const stream = fs.createReadStream(file, { encoding: 'utf8' })
    stream.on('data', (data) => {
      console.log(data)
      stream.destroy()
    })
    stream.on('close', (): void => {
      resolve(true)
    })
  })
}

streamFile(
  '/Users/sammyrobens-paradise/personal/build-your-drag-and-drop/test-data/chicken.jpg'
)
