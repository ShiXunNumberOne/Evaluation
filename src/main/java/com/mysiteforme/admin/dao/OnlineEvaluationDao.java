package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.Etask;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
@Repository
public interface OnlineEvaluationDao {
    List<HashMap> selectStudentEvaluation(Long u_id);
    List<HashMap> selectColleagueEvaluation(Long u_id);
    List<HashMap> selectOneselfEvaluation(Long u_id);
    List<Etask>  selectBatchName();
    List<HashMap> selectBatchIdStudentEvaluation(Long user_id,int batch_id);
    List<HashMap> selectBatchIdColleagueEvaluation(Long user_id,int batch_id);
    List<HashMap> selectBatchIdOneselfEvaluation(Long user_id,int batch_id);

}