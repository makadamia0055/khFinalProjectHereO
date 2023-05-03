package com.hereo.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.StadiumDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.StadiumImageVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

@Service
public class StadiumServiceImp implements StadiumService{
	
	@Autowired
	StadiumDAO stadiumDao;
	
	String uploadPath = "D:\\uploadfiles";
	
	private List<StadiumImageVO> uploadFiles(MultipartFile[] files, int si_sd_num) {
	    ArrayList<StadiumImageVO> fileList = new ArrayList<StadiumImageVO>();
	    if (files == null || files.length == 0) {
	        return fileList;
	    }
	    for (MultipartFile file : files) {
	        if (file == null || file.getOriginalFilename().length() == 0) {
	            continue;
	        }
	        String fileName = "";
	        try {
	            fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
	            System.out.println(fileName);

	            StadiumImageVO stadiumImageVo = new StadiumImageVO();
	            stadiumImageVo.setSi_sd_num(si_sd_num); // si_sd_num 설정
	            stadiumImageVo.setSi_filename(fileName);
	            fileList.add(stadiumImageVo); // fileList에 추가
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return fileList;
	}
//	private boolean checkStadium(StadiumVO stadium) {
//		if(stadium == null ||
//		   stadium.getSd_name() == null||
//		   stadium.getSd_name().trim().length() ==0)
//			return false;
//		return true;
//	}
		
		@Override
		public ArrayList<StadiumVO> getStadiumList(Criteria cri) {
			if(cri == null)
				cri = new Criteria();
			return stadiumDao.selectBoardList(cri);
		}
		
		@Override
		public int getStadiumTotalCount(Criteria cri) {
			return stadiumDao.selectStadiumTotalCount(cri);
		}

		@Override
		public StadiumVO getStadium(int sd_num, MembersVO user) {		
			return stadiumDao.selectStadium(sd_num);
		}

		@Override
		public ArrayList<StadiumImageVO> getFileList(int sd_num) {
			
			return stadiumDao.selectFileList(sd_num);
		}

		@Override
		public void insertStadium(StadiumVO stadium, MembersVO user, MultipartFile[] files) {
		    // 파일 업로드
		    List<StadiumImageVO> fileList = uploadFiles(files, stadium.getSd_num());
		    //지역 정보를 가져오는 작업을 진행해야함 ..
		    // 스타디움 등록
		    stadium.setSd_me_id(user.getMe_id());
		    stadiumDao.insertStadium(stadium);
		    // 파일 정보 저장
		    for (StadiumImageVO file : fileList) {
		        file.setSi_sd_num(stadium.getSd_num());
		        stadiumDao.insertStadiumImage(file);
		    }
		}

		@Override
		public RegionDetailVO getRegionDetail(int rd_num) {
			
			return stadiumDao.selectRegionDetail(rd_num);
		}

		@Override
		public ArrayList<StadiumTimetableVO> getStadiumTimetableList(MembersVO user) {
			if(user == null)
			return null;
			return stadiumDao.selectStadiumTimetableList(user);
		}
	

		






}
