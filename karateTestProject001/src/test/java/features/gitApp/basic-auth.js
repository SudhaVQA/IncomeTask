function fn(creds){
    var temp = creds.username + ':' + creds.password;
    var Base64 = Java.type('java.util.Base64');
    var encoded = Base64.getEncoder().encoderToString(temp.toString().getBytes());
    return 'Basic' + encoded;
}