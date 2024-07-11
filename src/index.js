setTimeout(() => {
    throw new Error(`foo`)
}, 1000)

process.on('SIGTERM', () => {
    console.log('got sigterm')
})