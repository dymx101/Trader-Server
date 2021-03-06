package com.trader.platform.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterDisposer;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class JdbcTemplateWrapper extends JdbcTemplate {
	
	public JdbcTemplateWrapper(DataSource dataSource){
		super(dataSource);
	}

	
	public <T> T queryForObject(String sql, RowMapper<T> rowMapper) throws DataAccessException {
		try {
			return super.queryForObject(sql, rowMapper);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (DataAccessException e) {
			throw e;
		}		
	}
	
	public <T> T queryForObject(String sql, Object[] args, int[] argTypes, RowMapper<T> rowMapper)
			throws DataAccessException {
		try {
			return super.queryForObject(sql, args, argTypes, rowMapper);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (DataAccessException e) {
			throw e;
		}
		
	}

	public <T> T queryForObject(String sql, Object[] args, RowMapper<T> rowMapper) throws DataAccessException {
		try {
			return super.queryForObject(sql, args, rowMapper);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (DataAccessException e) {
			throw e;
		}
	}

	public <T> T queryForObject(String sql, RowMapper<T> rowMapper, Object... args) throws DataAccessException {
		try {
			return super.queryForObject(sql, rowMapper, args);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (DataAccessException e) {
			throw e;
		}
	}
	
	
	/**
     * 增加并且获取主键
     * @param sql sql语句
     * @param params 参数列表
     * @return 主键
     */
    public int insertAndGetKey(final String sql, final Object... params) {         
        final KeyHolder key = new GeneratedKeyHolder();
        
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(sql,
                        PreparedStatement.RETURN_GENERATED_KEYS);
                PreparedStatementSetter pss = newArgPreparedStatementSetter(params);
                try {
                    if (pss != null) {
                        pss.setValues(ps);
                    }
                } finally {
                    if (pss instanceof ParameterDisposer) {
                        ((ParameterDisposer) pss).cleanupParameters();
                    }
                }
                return ps;
            }
        }, key);
         
        return key.getKey().intValue();
    }

	
}