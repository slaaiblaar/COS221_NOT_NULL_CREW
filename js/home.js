function clearCookies(){
    $('#Login').click(function(){
    document.cookie = 'loginStatus=;expires=Thu, 01 Jan 00:00:00 UTC;path=/;';
    document.cookie = 'userName=;expires=Thu, 01 Jan 00:00:00 UTC;path=/;';
    document.cookie = 'resetLogin=True;expires=0;path=/;';
    console.log("valid");
});
}

