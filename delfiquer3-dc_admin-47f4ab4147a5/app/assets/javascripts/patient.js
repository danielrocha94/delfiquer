$(function () {
  if ($('#patient-info')[0]) {
    var socket = io.connect('http://127.0.0.1:8080');

    var spo2 = 0
    var ekg = 0

    // values between 0 and 1300
    socket.on('daq.patient.1.ekg', function(data) {
      ekg = (parseFloat(data)/ 30) + 90
      console.log(ekg)
    })

    socket.on('daq.patient.1.temperature', function(data) {
      $("#Temp").html(data)
    })

    socket.on('daq.patient.1.spo2', function(data) {
      spo2 = parseFloat(data)
      $("#SpO2").html(data)
    })

    var canvas = document.getElementById("EKG_Canvas")
    var context = canvas.getContext("2d")
    var lasty = 0
    context.lineWidth = .5

    context.strokeStyle = '#FFF';
    context.beginPath()
    var h = canvas.height/2
    h = Math.floor(h)
    context.moveTo(0, h)
    context.lineTo(canvas.width, h)
    context.stroke()

    setInterval(function() {
      y = ekg
      var shift = 2
      // shift everything to the left:
      var imageData = context.getImageData(shift, 0, canvas.width-1, canvas.height);
      context.putImageData(imageData, 0, 0);
      // now clear the right-most pixels:
      context.clearRect(canvas.width-shift, 0, shift, canvas.height);

      context.strokeStyle = '#F5F221';
      context.beginPath()
      context.moveTo(canvas.width-shift, canvas.height-lasty)
      context.lineTo(canvas.width-1, canvas.height-y)
      context.stroke()
      lasty = y

      context.strokeStyle = '#FFF';
      context.beginPath()
      var h = canvas.height/2
      h = Math.floor(h)
      context.moveTo(canvas.width-3, h)
      context.lineTo(canvas.width, h)
      context.stroke()
    }, 100)
  }
});
