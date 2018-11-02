package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NhiemVu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.VaiTro;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.VaiTroDAO;

@Repository
@Transactional
public class VaiTroDAOImpl implements VaiTroDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<NhiemVu> getNhiemVuById(int maNhanVien, int maDuAn) {
		Session session= sessionFactory.getCurrentSession();
		return session.createQuery("from NhiemVu where maDuAn ='"+maDuAn+"' and maNhanVien='"+maNhanVien+"'",NhiemVu.class).list();
	}
	
	@Override
	public VaiTro getVaiTroById(String maVaiTro) {
		Session session=sessionFactory.getCurrentSession();
		return session.createQuery("from VaiTro where isDelete =0 and ma_vai_tro = '"+ maVaiTro + "'",VaiTro.class).list().get(0);
	}
}
