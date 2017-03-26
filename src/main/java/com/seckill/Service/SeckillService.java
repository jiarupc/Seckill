package com.seckill.Service;

import com.seckill.DTO.Exposer;
import com.seckill.DTO.SeckillExecution;
import com.seckill.Exception.RepeatKillException;
import com.seckill.Exception.SeckillCloseException;
import com.seckill.Exception.SeckillException;
import com.seckill.Entity.Seckill;

import java.util.List;

/**
 * 业务接口：站在“使用者”角度设计接口
 * 三个方面：
 * 1、方法定义粒度
 * 2、参数
 * 3、返回类型（return 类型/异常）
 */
public interface SeckillService {
    /**
     * 查询所有秒杀记录
     *
     * @return
     */
    List<Seckill> getSeckillList();

    /**
     * 查询单个秒杀记录
     *
     * @param seckillId
     * @return
     */
    Seckill getById(long seckillId);

    /**
     * 秒杀开启时，输出秒杀接口地址
     * 否则，输出系统时间、秒杀时间
     *
     * @param seckillId
     */
    Exposer exportSeckillUrl(long seckillId);

    /**
     * 执行秒杀操作
     *
     * @param seckillId
     * @param userPhone
     * @param md5
     */
    SeckillExecution executeSeckill(long seckillId, long userPhone, String md5)
            throws SeckillException, SeckillCloseException, RepeatKillException;
}
