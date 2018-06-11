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
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RequirementActivity extends AppCompatActivity implements View.OnClickListener {

    private ImageView imgBtnAttachImage,imgBtnAttachPhoto,imgViewResult;
    static final int REQUEST_IMAGE_REQUEST  = 100;
    static final int REQUEST_IMAGE_CAPTURE = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_requirement);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar_Requirement);
        setSupportActionBar(toolbar);

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

          Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
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

        /*Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        Log.e("ERROR",takePictureIntent+"");
        if (getApplicationContext().getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA)) {
            startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
        }
*/      String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String imageFileName = timeStamp + ".jpg";
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        String pictureImagePath = storageDir.getAbsolutePath() + "/" + imageFileName;

        File file = new File(pictureImagePath);

        Uri outputFileUri = FileProvider.getUriForFile(getApplicationContext(), getApplicationContext().getApplicationContext().getPackageName() + ".provider", file);

        Intent CameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        CameraIntent.putExtra(MediaStore.EXTRA_OUTPUT, outputFileUri);
        CameraIntent.putExtra(Intent.EXTRA_RETURN_RESULT, true);
        CameraIntent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

        startActivityForResult(CameraIntent, 5);

    }
    @Override
    protected void onActivityResult(int requestCode,int resultCode,Intent data){


            if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
                Bundle extras = data.getExtras();
                Bitmap imageBitmap = (Bitmap) extras.get("data");
                imgViewResult.setImageBitmap(imageBitmap);
            }


    }
    @Override
    public void onClick(View v) {

        int iSelect=v.getId();

        if (iSelect == R.id.imageViewAdd) { attachImage(); }
            else if(iSelect == R.id.imageViewPhoto){attachPhoto();}

    }
}
