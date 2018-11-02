package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyHopDongDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HopDong;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.PhongBan;

@Repository
public class QuanLyHopDongDAOImpl implements QuanLyHopDongDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<HopDong> getAllHopDong() {
		Session session = this.sessionFactory.getCurrentSession();
		List<HopDong> listHopDong = session.createQuery("from HopDong").list();
		return listHopDong;
	}

	@Override
	public List<HopDong> getHopDongByPhongBan(String maPhongBan) {
		Session session = this.sessionFactory.getCurrentSession();
		PhongBan pb = session.load(PhongBan.class, maPhongBan);
		List<HoSoNhanVien> listHoSo = pb.getHoSoNhanViens();
		List<HopDong> listHopDong = new ArrayList<HopDong>();
		for (HoSoNhanVien hsnv : listHoSo) {
			List<HopDong> hdnv = hsnv.getHopDongs();
			int lastIndex = hdnv.size() - 1;
			if (hdnv.size() != 0 && hdnv.get(lastIndex).getTrangThai() == 1) {
				listHopDong.add(hdnv.get(lastIndex));
			}
		}
		return listHopDong;
	}

	@Override
	public void addHopDong(HopDong tthd) {
		System.out.println(tthd);
		Session session = this.sessionFactory.getCurrentSession();
		session.save(tthd);
	}

	@Override
	public void updateHopDong(HopDong tthd) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(tthd);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String getAutoId() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(
				"SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ffse1702a' AND TABLE_NAME = 'hop_dong'");
		;
		String index = query.getSingleResult().toString();
		return index;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String getRecordsTotal(String maPhongBan) {
		Session session = this.sessionFactory.getCurrentSession();

		String sql = "select count(*) from HopDong hd ";
		if (!maPhongBan.equals("ns")) {
			sql += " inner join hd.hoSoNhanVien where hd.hoSoNhanVien.phongBan.maPhongBan = '" + maPhongBan
					+ "' and hd.trangThai = 1";
		}
		Query query = session.createQuery(sql);
		System.out.println(sql);
		String recordsTotal = query.getSingleResult().toString();
		return recordsTotal;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String getRecordsFiltered(String sql) {
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql.replace("select hd", "select count(*)"));
		String recordsFiltered = query.getSingleResult().toString();
		return recordsFiltered;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HopDong> getAllHopDong(int iDisplayStart, int iDisplayLength, String sql) {
		System.out.println(sql);
		Session session = this.sessionFactory.getCurrentSession();
		List<HopDong> listHopDong = session.createQuery(sql).setFirstResult(iDisplayStart).setMaxResults(iDisplayLength)
				.list();

		return listHopDong;
	}
}
