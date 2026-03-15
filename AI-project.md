chromium browser 
free tts
speechSynthesis.speak(new SpeechSynthesisUtterance("Hello world"));
free stt
const rec = new webkitSpeechRecognition();
rec.lang = "en-US";
rec.onresult = e => console.log(e.results[0][0].transcript);
rec.start();
free model
lm studio
