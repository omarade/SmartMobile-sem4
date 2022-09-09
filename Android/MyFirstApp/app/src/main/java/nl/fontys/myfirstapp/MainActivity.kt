package nl.fontys.myfirstapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btnClickMe = findViewById<Button>(R.id.btn)
        val tvCounter = findViewById<TextView>(R.id.tvCounter)
        var timesClicked = 0

        btnClickMe.setOnClickListener {
            timesClicked++
            tvCounter.text = "Times Clicked: " + timesClicked
            Toast.makeText(this, "Button clicked", Toast.LENGTH_LONG).show()
        }
    }
}