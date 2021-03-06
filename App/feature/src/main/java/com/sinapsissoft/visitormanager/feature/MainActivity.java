package com.sinapsissoft.visitormanager.feature;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import com.sinapsissoft.visitormanager.feature.Adapter.VisitAdapter;
import com.sinapsissoft.visitormanager.feature.ClassAppVisit.IntStartActivity;
import com.sinapsissoft.visitormanager.feature.Dto.DtoVisit;

import java.util.ArrayList;
import java.util.List;


public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener, IntStartActivity {

    private RecyclerView vRecyclerView;
    private RecyclerView.Adapter vAdapterVisit;
    private RecyclerView.LayoutManager vLayoutManager;
    private List<DtoVisit> dtoVisits;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        loadView();
    }

    public void loadView(){
        vRecyclerView=(RecyclerView)findViewById(R.id.recyclerViewVisit);
        vRecyclerView.setHasFixedSize(true);
        //use a linear layout manager
        vLayoutManager=new LinearLayoutManager(this);
        vRecyclerView.setLayoutManager(vLayoutManager);
        //Specify an adapter
        vAdapterVisit=new VisitAdapter(loadData(),this);
        vRecyclerView.setAdapter(vAdapterVisit);

    }

    public List<DtoVisit> loadData(){

        dtoVisits=new ArrayList<>();
        dtoVisits.add(new DtoVisit("001","Sianapsis Soft","6/10/2018","20","1"));
        dtoVisits.add(new DtoVisit("002","Sianapsis Soft","6/10/2018","50","2"));
        dtoVisits.add(new DtoVisit("003","Sianapsis Soft","6/10/2018","40","3"));
        dtoVisits.add(new DtoVisit("004","Sianapsis Soft","6/10/2018","90","4"));
        dtoVisits.add(new DtoVisit("005","Sianapsis Soft","6/10/2018","90","5"));
        dtoVisits.add(new DtoVisit("006","Sianapsis Soft","6/10/2018","10","6"));
        return dtoVisits;
    }
    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {

        } else if (id == R.id.nav_slideshow) {

        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public void callbackStartActivity(int id) {
        Log.i("Information","Ok"+id);
       Intent intent=new Intent(this, VisitActivity.class);
        startActivity(intent);
    }
}
