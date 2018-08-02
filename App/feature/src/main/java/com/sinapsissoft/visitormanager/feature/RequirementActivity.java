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

          Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);

          //intent.setAction(Intent.ACTION_GET_CONTENT);
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

        /*Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        Log.e("ERROR",takePictureIntent+"");
        if (getApplicationContext().getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA)) {
            startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
        }*/
        try{
            //String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            //String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            //String imageFileName =  "prueba.jpg";
            //File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
            //String pictureImagePath = storageDir.getAbsolutePath() + "/" + imageFileName;
            //String pictureImagePath =  "Images/" + imageFileName;

            //File file = new File(pictureImagePath);
            //String authorities = getApplicationContext().getPackageName() + ".fileprovider";

            /*if(file.exists()){
                Log.e("Existe file","Existe file");
            }else{
                Log.e("NO Existe file","NO Existe file");
                file.mkdirs();
            }*/
            //com.sinapsissoft.visitormanager
            File imagePath =  new File(this.getBaseContext().getFilesDir(),"images");
            File newFile = new File(imagePath,"prueba.jpg");

            String flPrueba = createFile(R.drawable.ic_menu_send);
            Uri contextUri = FileProvider.getUriForFile(this.getBaseContext(),"com.sinapsissoft.visitormanager.fileprovider",new File(flPrueba));
            //Uri outputFileUri = FileProvider.getUriForFile(getApplicationContext(), authorities, file);

            Intent CameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            CameraIntent.putExtra(MediaStore.EXTRA_OUTPUT, contextUri);
            CameraIntent.putExtra(Intent.EXTRA_RETURN_RESULT, true);
            //CameraIntent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

            startActivityForResult(CameraIntent, 5);
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



        if(resultCode == RESULT_OK)
        {
            Uri selectedImage = data.getData();

            //UnityPlayer.UnitySendMessage("Main Camera", "OpenImage", getRealPathFromURI(selectedImage));
        }


    }
    @Override
    public void onClick(View v) {

        int iSelect=v.getId();

        if (iSelect == R.id.imageViewAdd) { attachImage(); }
            else if(iSelect == R.id.imageViewPhoto){attachPhoto();}

    }
}
