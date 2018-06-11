package com.sinapsissoft.visitormanager.feature;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class VisitActivity extends AppCompatActivity {

    private Spinner spinner;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_visit);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar_visit);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fabAddRequest);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
                startActivity();
            }
        });
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        loadVIew();
    }
    public void loadVIew(){
        spinner=(Spinner)findViewById(R.id.spinnerBusiness);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapterSpinner=ArrayAdapter.createFromResource(this,R.array.list_business,android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapterSpinner);

    }
    public void startActivity(){
        Intent intent=new Intent(this,RequirementActivity.class);
        startActivity(intent);

    }

}
