package com.sinapsissoft.visitormanager.feature;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.content.FileProvider;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RequirementActivity extends AppCompatActivity implements View.OnClickListener {

    private ImageView imgBtnAttachImage,imgBtnAttachPhoto,imgViewResult;
    static final int REQUEST_IMAGE_REQUEST  = 100;
    static final int REQUEST_IMAGE_CAPTURE = 1;

    private Bitmap mImageBitmap;
    private String mCurrentPhotoPath;
    private ImageView mImageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_requirement);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar_Requirement);
        setSupportActionBar(toolbar);

        mImageView = (ImageView) findViewById(R.id.imageViewResult);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        loadView();

    }
    public void loadView(){
        imgBtnAttachImage=(ImageView)findViewById(R.id.imageViewAdd);
        imgBtnAttachImage.setOnClickListener(this);
        imgBtnAttachPhoto=(ImageView)findViewById(R.id.imageViewPhoto);
        imgBtnAttachPhoto.setOnClickListener(this);
        imgViewResult=(ImageView)findViewById(R.id.imageViewResult);



    }

    private void attachImage(){
      try {

          Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
          startActivityForResult(intent,1);
          if (intent.resolveActivity(getPackageManager()) != null) {
              //Device has no app that handles gallery intent
              imgBtnAttachImage.setVisibility(View.GONE);
          }
      }
      catch (Exception e)
      {
          e.printStackTrace();
          Log.e("ERROR",e.getMessage());

      }


    }


    public void attachPhoto(){
        try{

            File imagePath =  new File(this.getBaseContext().getFilesDir(),"images");
            File newFile = new File(imagePath,"prueba.jpg");

            String flPrueba = createFile(R.drawable.ic_menu_send);
            Uri contextUri = FileProvider.getUriForFile(this.getBaseContext(),"com.sinapsissoft.visitormanager.fileprovider",new File(flPrueba));
            Intent CameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            startActivityForResult(CameraIntent, 0);
        }catch (Exception e){
            e.printStackTrace();
            Log.e("ERROR",e.getMessage());
        }


    }
    private String createFile(int resId){

        Bitmap bm = BitmapFactory.decodeResource(getResources(),resId);
        String path = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)+"/"+resId+".jpg";
        File fl = new File(path);

        try{
            OutputStream ou = new FileOutputStream(fl);
            bm.compress(Bitmap.CompressFormat.JPEG,100 ,ou);
            ou.flush();
            ou.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return fl.getPath();
    }

    @Override
    protected void onActivityResult(int requestCode,int resultCode,Intent data){


        try {
           mImageBitmap = (Bitmap) data.getExtras().get("data");
           mImageView.setImageBitmap(mImageBitmap);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void onClick(View v) {

        int iSelect=v.getId();

        if (iSelect == R.id.imageViewAdd) { attachImage(); }
            else if(iSelect == R.id.imageViewPhoto){attachPhoto();}

    }
}
