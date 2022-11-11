package com.example.tiro_parabolico;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    Button btn_angle;

    EditText edit_X;
    EditText edit_Y;
    EditText edit_g;
    EditText edit_v0;
    EditText edit_r;
    EditText edit_v0E;
    EditText edit_rE;

    TextView text_result1;
    TextView text_result2;
    TextView ErrorY;
    TextView ErrorX;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edit_X = findViewById(R.id.DistanceX);
        edit_Y = findViewById(R.id.DistanceY);
        edit_g = findViewById(R.id.Gravity);
        edit_v0 = findViewById(R.id.V0);
        edit_r = findViewById(R.id.Radio);
        edit_v0E = findViewById(R.id.V0E);
        edit_rE = findViewById(R.id.RadioE);

        btn_angle = findViewById(R.id.Button);

        text_result1 = findViewById(R.id.Result1);
        text_result2 = findViewById(R.id.Result2);
        ErrorY = findViewById(R.id.EY);
        ErrorX = findViewById(R.id.EX);

        btn_angle.setOnClickListener(new View.OnClickListener() {
            @SuppressLint("SetTextI18n")
            @Override
            public void onClick(View view) {
                text_result1.setText(anglen(Double.parseDouble(edit_X.getText().toString()),
                        Double.parseDouble(edit_Y.getText().toString()),
                        Double.parseDouble(edit_g.getText().toString()),
                        Double.parseDouble(edit_v0.getText().toString()),
                        Double.parseDouble(edit_r.getText().toString()))+"");
                text_result2.setText(anglep(Double.parseDouble(edit_X.getText().toString()),
                        Double.parseDouble(edit_Y.getText().toString()),
                        Double.parseDouble(edit_g.getText().toString()),
                        Double.parseDouble(edit_v0.getText().toString()),
                        Double.parseDouble(edit_r.getText().toString()))+"");
                ErrorX.setText(errorX(Double.parseDouble(edit_X.getText().toString()),
                        Double.parseDouble(edit_Y.getText().toString()),
                        Double.parseDouble(edit_g.getText().toString()),
                        Double.parseDouble(edit_v0.getText().toString()),
                        Double.parseDouble(edit_r.getText().toString()),
                        Double.parseDouble(edit_v0E.getText().toString()),
                        Double.parseDouble(edit_rE.getText().toString()))+"");
                ErrorY.setText(errorY(Double.parseDouble(edit_X.getText().toString()),
                        Double.parseDouble(edit_Y.getText().toString()),
                        Double.parseDouble(edit_g.getText().toString()),
                        Double.parseDouble(edit_v0.getText().toString()),
                        Double.parseDouble(edit_r.getText().toString()),
                        Double.parseDouble(edit_v0E.getText().toString()),
                        Double.parseDouble(edit_rE.getText().toString()))+"");
            }
        });

    }

    public double anglep (double x, double y, double g, double v0, double r){
        double result_p = 0;

        double a = (g*Math.pow(x,2))/(2*Math.pow(v0,2));
        double b = -x;
        double c = (g*Math.pow(x,2))/(2*Math.pow(v0,2))+y;
        double tan_p = (-b+Math.sqrt(Math.pow(b,2)-4*a*c))/(2*a);
        double alpha_r_p = Math.atan(tan_p);
        double alpha_0_p = 180 * alpha_r_p / Math.PI;
        double alpha_p = 90;

        while(Math.abs(alpha_0_p - alpha_p) >= 0.01 ){
            alpha_0_p = alpha_p;
            double y_n = y + r*Math.sin(alpha_r_p);
            double x_n = x - r*Math.cos(alpha_r_p);
            a = (g*Math.pow(x_n,2))/(2*Math.pow(v0,2));
            b = -x_n;
            c = (g*Math.pow(x_n,2))/(2*Math.pow(v0,2))+y_n;
            tan_p = (-b+Math.sqrt(Math.pow(b,2)-4*a*c))/(2*a);
            alpha_r_p = Math.atan(tan_p);
            alpha_p = 180 * alpha_r_p / Math.PI;
            result_p = Math.round(alpha_p*100)/100d;
        }

        return result_p;
    }

    public double anglen (double x, double y, double g, double v0, double r){
        double result_n = 0;

        double a = (g*Math.pow(x,2))/(2*Math.pow(v0,2));
        double b = -x;
        double c = (g*Math.pow(x,2))/(2*Math.pow(v0,2))+y;
        double tan_n = (-b-Math.sqrt(Math.pow(b,2)-4*a*c))/(2*a);
        double alpha_r_n = Math.atan(tan_n);
        double alpha_0_n = 180 * alpha_r_n / Math.PI;
        double alpha_n = 90;

        while(Math.abs(alpha_0_n - alpha_n) >= 0.01 ){
            alpha_0_n = alpha_n;
            double y_n = y + r*Math.sin(alpha_r_n);
            double x_n = x - r*Math.cos(alpha_r_n);
            a = (g*Math.pow(x_n,2))/(2*Math.pow(v0,2));
            b = -x_n;
            c = (g*Math.pow(x_n,2))/(2*Math.pow(v0,2))+y_n;
            tan_n = (-b-Math.sqrt(Math.pow(b,2)-4*a*c))/(2*a);
            alpha_r_n = Math.atan(tan_n);
            alpha_n = 180 * alpha_r_n / Math.PI;
            result_n = Math.round(alpha_n*100)/100d;
        }

        return result_n;
    }

    public double errorAng (double x, double y, double g, double v0, double v0E){
        double result = 0;
        double dv0 = v0E;

        double dalpha_dv0 = ( g*Math.abs(x) ) / ( v0*Math.sqrt( Math.pow(v0,4) -
                2*g*y*Math.pow(v0,2) - Math.pow(g*x,2) ) );
        result = Math.abs( dalpha_dv0*dv0 );

        result = Math.round(result*100)/100d;

        return result;
    }

    public double errorX (double x, double y, double g, double v0, double r, double v0E, double rE){
        double result = 0;
        double dr = rE;
        double alpha = anglen (x, y,  g,  v0, r);
        double dalpha = errorAng (x, y, g, v0, v0E);
        alpha = Math.PI * alpha/180;
        dalpha = Math.PI * dalpha/180;

        double errorRelativo = 0.10026995838513482;

        double dx_dr = Math.cos(alpha);
        double dx_dalpha = -r*Math.sin(alpha);

        result = Math.sqrt( Math.pow(dx_dr*dr,2) + Math.pow(dx_dalpha*dalpha,2) );

        result = Math.round(Math.sqrt(Math.pow(result,2) + Math.pow(x*errorRelativo,2))*100)/100d;

        return result;
    }

    public double errorY (double x, double y, double g, double v0, double r, double v0E, double rE){
        double result = 0;
        double dr = rE;
        double alpha = anglen (x, y,  g,  v0, r);
        double dalpha = errorAng (x, y, g, v0, v0E);
        double dv0 = v0E;
        alpha = Math.PI * alpha/180;
        dalpha = Math.PI * dalpha/180;

        double errorRelativo = 0.10026995838513482;
        double dx_dr = Math.cos(alpha);
        double dx_dalpha = -r*Math.sin(alpha);
        double dx = Math.round(
                Math.sqrt(Math.pow(Math.sqrt( Math.pow(dx_dr*dr,2)
                        + Math.pow(dx_dalpha*dalpha,2) ),2)
                        + Math.pow(x*errorRelativo,2))*100)/100d;

        double dy_dr = Math.sin(alpha);
        double dy_dx = Math.tan(alpha) - (g*x)/((v0*v0)*Math.pow(Math.cos(alpha),2));
        double dy_dv0 = (g*x*x)/(Math.pow(v0,3)*Math.pow(Math.cos(alpha),2));
        double dy_dalpha = Math.pow(Math.cos(alpha),-2)*x -
                ( Math.tan(alpha)/Math.pow(Math.cos(alpha),2) ) * (g*x*x)/(v0*v0)
                +r*Math.cos(alpha);

        result = Math.round(
                Math.sqrt( Math.pow(dy_dr*dr,2) + Math.pow(dy_dalpha*dalpha,2)
                        + Math.pow(dy_dv0*dv0,2)  + Math.pow(dy_dx*dx,2)
                )*100)/100d;

        return result;
    }
}