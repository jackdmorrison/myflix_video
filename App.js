const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
app.get('/video/:id', (req, res) => {
  // res.sendFile('vids/Test.mp4', { root: __dirname });
  const data = fetch(`http://34.243.107.31/myflix/videos/${req.params.id}`).then((response)=> response.json());
  vid='vids/'+data.video.file;
  try{
    res.sendFile(vid,{root:__dirname});
  }catch(err){
    console.log(err);
  }
  

  });
app.listen(4000, () => {
  console.log('Listening on port 4000!')
});

// function App() {
//   return (
//     <div className="App">
//     </div>
//   );
// }

//export default App;
