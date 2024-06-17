var nodemailer=require('nodemailer');

async function sendVerifyMail(to_email){
    let transporter =nodemailer.createTransport({
        service:"gmail",
        host:"smtp.gmail.com",
        port:465,
        secure:false,
        auth:{
            user:"jamesmaverick1869@gmail.com",
            pass:"ncrj vggd kmzw xmkg"
        }  
    });
    let info=transporter.sendMail({
        to:to_email,
        from:"jamesmaverick1869@gmail.com",
        subject: "Verify email to Twitter_clone",
        html: "<h2 style = \"color:red\">Please click on link to verify email id </h2> <a href=\"http://localhost:8080/verifymail?email="+to_email+"\">Click here to verify email </a>"
    });
    if(info.messageId){
        return true;
    }
    else{
        return false;
    }
};
module.exports=sendVerifyMail;


