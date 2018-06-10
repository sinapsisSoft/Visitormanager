package com.sinapsissoft.visitormanager.feature.Adapter;


import android.support.annotation.NonNull;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.sinapsissoft.visitormanager.feature.Dto.DtoVisit;
import com.sinapsissoft.visitormanager.feature.R;

import java.util.List;

public class VisitAdapter extends RecyclerView.Adapter<VisitAdapter.ViewHolder> {

    private List<DtoVisit> dtoVisits;

    public VisitAdapter(List<DtoVisit> dto){
        dtoVisits=dto;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //create a new view

        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_visit, parent, false);
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.vImgDescription.setId(Integer.parseInt(dtoVisits.get(position).sId));
        holder.vValueStatus.setText(dtoVisits.get(position).sState+"%");
        holder.vProgressBarState.setProgress(Integer.parseInt(dtoVisits.get(position).sState));
        holder.vTextDate.setText(dtoVisits.get(position).sDate);
        holder.vTextTitle.setText(dtoVisits.get(position).sTitle);
        holder.vTextCode.setText(dtoVisits.get(position).sCode);
    }

    @Override
    public int getItemCount() {
        return dtoVisits.size();
    }
    @Override
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
    }


    public static class ViewHolder extends RecyclerView.ViewHolder{

        public CardView vCardView;
        public TextView vTextCode;
        public TextView vTextTitle;
        public TextView vTextDate;
        public ProgressBar vProgressBarState;
        public TextView vValueStatus;
        public ImageView vImgDescription;

        public ViewHolder(View view){
            super(view);
            vCardView=(CardView)view.findViewById(R.id.cartViewVisit);
            vTextCode=(TextView)view.findViewById(R.id.textViewCode);
            vTextTitle=(TextView)view.findViewById(R.id.textViewTitle);
            vTextDate=(TextView)view.findViewById(R.id.textViewDate);
            vProgressBarState=(ProgressBar)view.findViewById(R.id.progressBarState);
            vValueStatus=(TextView)view.findViewById(R.id.textViewState);
            vImgDescription=(ImageView)view.findViewById(R.id.btnDescription);
        }
    }

}
