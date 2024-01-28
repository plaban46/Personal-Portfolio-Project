var typed = new Typed(".text", {
    strings: ["Student", "Web and App Developer", "Personal Investors"],
    typeSpeed: 100,
    backSpeed: 100,
    backDelay: 1000,
    loop: true
});


 
document.addEventListener('DOMContentLoaded', function() {
 
    document.getElementById('homeLink').addEventListener('click', function() {
      console.log("Home link clicked");  
      openDialog('Home', 'Home Button is clicked!');
    });
  
    document.getElementById('more_about_me').addEventListener('click', function() {
      console.log("More About Me link clicked"); 
      openDialog('More About Me', 'All About Button is clicked !');
    });
  });
  
  function openDialog(content, customText) {
    console.log("Opening dialog with custom text:", customText);  
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('customDialog').style.display = 'block';
    // Customize the content of the dialog
    document.getElementById('dialogContent').innerHTML = customText;
  }
  
  function closeDialog() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('customDialog').style.display = 'none';
  }
  