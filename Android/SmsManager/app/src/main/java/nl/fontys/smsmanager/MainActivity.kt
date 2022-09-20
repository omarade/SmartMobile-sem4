package nl.fontys.smsmanager

import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.telephony.SmsManager
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import java.util.jar.Manifest


class MainActivity : AppCompatActivity() {

    val SEND_SMS_PERMISSION_CODE : Int = 1

    lateinit var number : EditText
    lateinit var textMessage : EditText
    lateinit var button : Button


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        number = findViewById(R.id.editTextPhone)
        textMessage = findViewById(R.id.editTextTextMultiLine)
        button = findViewById(R.id.btnSend)

        button.isEnabled = false

        if (checkPermission(android.Manifest.permission.SEND_SMS)) {
            button.isEnabled = true
        } else {
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.SEND_SMS), SEND_SMS_PERMISSION_CODE)
        }
    }


    fun onSend(v: View) : Void?{
        val phoneNumber : String = number.text.toString()
        val txtMessage : String = textMessage.text.toString()

        if (phoneNumber == null || phoneNumber.length == 0 || txtMessage == null || txtMessage.length == 0) {
            return null;
        }




        if (checkPermission(android.Manifest.permission.SEND_SMS)) run {
            button.isEnabled = true

            var smsManager: SmsManager = SmsManager.getDefault()
            smsManager.sendTextMessage(phoneNumber, null, txtMessage, null, null)

            button.isEnabled = false
            textMessage.text.clear()

            Toast.makeText(this, "Message Sent!", Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(this, "Permission Denied", Toast.LENGTH_SHORT).show()
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.SEND_SMS), SEND_SMS_PERMISSION_CODE)
        }
        return null
    }

    private fun checkPermission(permission: String) : Boolean {
        var check : Int = ContextCompat.checkSelfPermission(this, permission)
        return check == PackageManager.PERMISSION_GRANTED
    }
}