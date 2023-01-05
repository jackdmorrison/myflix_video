
const express = require('express');
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const app = express();
app.get('/video/:id', (req, res) => {
  // res.sendFile('vids/Test.mp4', { root: __dirname });
  console.log(req.params.id)
  const dataFetch= async ()=>{
    const data = await (
      await fetch(`http://34.243.107.31/myflix/videos/${req.params.id}`)
    ).json();
    console.log(data)
    vid='vids/'+data.video.file;
    res.sendFile(vid,{root:__dirname});
  }
  dataFetch();
  
  //vid='vids/'+vidData.video.video.file;
  //res.sendFile(vid,{root:__dirname});
  

  });
app.listen(4000, () => {
  console.log('Listening on port 4000!')
});
