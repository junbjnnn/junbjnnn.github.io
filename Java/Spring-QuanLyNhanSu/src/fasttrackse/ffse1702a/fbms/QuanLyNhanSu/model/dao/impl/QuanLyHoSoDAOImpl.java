package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyHoSoDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

@Repository
@SuppressWarnings({ "rawtypes", "unchecked" })
public class QuanLyHoSoDAOImpl implements QuanLyHoSoDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public HoSoNhanVien getHoSoNhanVienById(int maNhanVien) {
		Session session = this.sessionFactory.getCurrentSession();
		HoSoNhanVien hsnv = session.load(HoSoNhanVien.class, new Integer(maNhanVien));
		System.out.println(hsnv);
		return hsnv;
	}

	@Override
	public String getRecordsTotal(String maPhongBan) {
		Session session = this.sessionFactory.getCurrentSession();

		String sql = "SELECT COUNT(*) FROM `ho_so_nhan_vien`";
		if (!maPhongBan.equals("ns")) {
			sql += " WHERE ma_phong_ban = '" + maPhongBan + "' and trang_thai = 1";
		}
		Query query = session.createSQLQuery(sql);

		String recordsTotal = query.getSingleResult().toString();
		return recordsTotal;
	}

	@Override
	public String getRecordsFiltered(String sql) {
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery(sql.replace("select hs", "select count(*)"));
		String recordsFiltered = query.getSingleResult().toString();
		return recordsFiltered;
	}

	@Override
	public List<HoSoNhanVien> getAllHoSo() {
		Session session = this.sessionFactory.getCurrentSession();
		List<HoSoNhanVien> listHoSo = session.createQuery("from HoSoNhanVien").list();
		return listHoSo;
	}

	@Override
	public List<HoSoNhanVien> getAllHoSo(int iDisplayStart, int iDisplayLength, String sql) {

		Session session = this.sessionFactory.getCurrentSession();
		List<HoSoNhanVien> listHoSo = session.createQuery(sql).setFirstResult(iDisplayStart)
				.setMaxResults(iDisplayLength).list();

		return listHoSo;
	}

	@Override
	public List<HoSoNhanVien> getHoSoByPhongBan(String maPhongBan) {
		Session session = this.sessionFactory.getCurrentSession();

		// PhongBan pb = session.load(PhongBan.class, maPhongBan);
		// List<HoSoNhanVien> listHoSo = pb.getHoSoNhanViens();

		Query query = session.createQuery("from HoSoNhanVien where ma_phong_ban = :maPhongBan and trang_thai = 1 ");
		query.setParameter("maPhongBan", maPhongBan);
		List<HoSoNhanVien> listHoSo = query.list();
		return listHoSo;
	}

	@Override
	public void addHoSoNhanVien(HoSoNhanVien hsnv) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(hsnv);
	}

	@Override
	public void updateHoSoNhanVien(HoSoNhanVien hsnv) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(hsnv);
	}

	@Override
	public void deleteHoSoNhanVien(int maNhanVien) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("update HoSoNhanVien set trang_thai = 2 where ma_nhan_vien = :maNhanVien");
		query.setParameter("maNhanVien", maNhanVien);
		query.executeUpdate();
	}

	@Override
	public String getAutoId() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(
				"SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ffse1702a' AND TABLE_NAME = 'ho_so_nhan_vien'");

		String index = query.getSingleResult().toString();
		return index;
	}

}
