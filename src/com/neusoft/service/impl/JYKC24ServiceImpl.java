package com.neusoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import lombok.Data;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.neusoft.dao.IAa26Dao;
import com.neusoft.dao.IJYKC24Dao;
import com.neusoft.dao.IKc02Dao;
import com.neusoft.model.JK_KC02;
import com.neusoft.model.JY_KC24;
import com.neusoft.service.IJYKC24Service;
import com.neusoft.util.DateUtil;
import com.neusoft.util.PageHelper;
import com.neusoft.util.PageHelper.Page;
@Service
public class JYKC24ServiceImpl implements IJYKC24Service{
 
	private static Logger logger = Logger.getLogger(JYKC24ServiceImpl.class);
	
	@Resource
	public IJYKC24Dao jyKc24Dao;
	@Resource
	public IAa26Dao aa26Dao;
	@Resource
	public IKc02Dao kc02Dao;
	@Override
	public List<JY_KC24> findAll() {
		List<JY_KC24> list = jyKc24Dao.findAll();
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public PageHelper.Page<JY_KC24> findAllByPage() {
		PageHelper.startPage(1, 10);
		findAll();
		return PageHelper.endPage();
	}
	
	public List<JY_KC24> findAllNoAccount(String begin_time, String end_time){
		List<JY_KC24> list = jyKc24Dao.findAllNoAccount(begin_time,end_time);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public PageHelper.Page<JY_KC24> findAllNoAccountByPage(String begin_time, String end_time, int def_pageNum, int def_pageSize){
		PageHelper.startPage(def_pageNum, def_pageSize);
		findAllNoAccount(begin_time, end_time);
		PageHelper.Page<JY_KC24> list = PageHelper.endPage();
		list = convertData(list);
		return list;
	}
	private PageHelper.Page<JY_KC24> convertData(PageHelper.Page<JY_KC24> list) {

		for (JY_KC24 kc24 : list.getResult()) {
			kc24.setAAE040(DateUtil.subStrTime(kc24.getAAE040()));
			kc24.setYAB003(aa26Dao.getProvinceNameByCode(kc24.getYAB003()));
			kc24.setYAB300(aa26Dao.getProvinceNameByCode(kc24.getYAB300()));
			String aaa204 = kc24.getAAA204();
			if (aaa204 == null || "".equals(aaa204)) {
				if ("1".equals(kc24.getAAE314())) {
					kc24.setAAA204("已对账");
				} else {
					kc24.setAAA204("未对账");
				}
			}
		}
		
		return list;
	}
	@Override
	public List<Object> getAxisTime(String aac002, String akc190, String akc351, String yab060, String yab600) {
		
		if (yab060 != null) {
			yab060 = yab060.substring(0, 2);
		}
		if (yab600 != null) {
			yab600 = yab600.substring(0, 2);
		}
		List<JK_KC02> list_kc02 = kc02Dao.findAllByCondition(aac002, yab060, yab600, "ASC");
		List<JY_KC24> list_kc24 = jyKc24Dao.findAllByCondition(akc190, akc351);
		List<Object> list = convertAxisTime(list_kc02,list_kc24);
		return list;
	}
	
	@Override
	public List<Object> getAxisTime(String aac002) {
		List<JK_KC02> list_kc02 = kc02Dao.findAllByCondition(aac002, null, null, "ASC");
		List<JY_KC24> list_kc24 = jyKc24Dao.findByCondition(null,aac002,null, "ASC");
		List<Object> list = convertAxisTime(list_kc02,list_kc24);
		return list;
	}
	
	@Override
	public Page<JY_KC24> findByCondition(String aac001, String aac002,
			String aac003,int def_pageNum, int def_pageSize) {
		PageHelper.startPage(def_pageNum, def_pageSize);
		jyKc24Dao.findByCondition(aac001,aac002,aac003,"DESC");
		PageHelper.Page<JY_KC24> list = PageHelper.endPage();
		list = convertData(list);
		return list;
	}
	
	@Override
	public JY_KC24 getKc24ByAkc351(String akc351) {
		JY_KC24 data = jyKc24Dao.getKc24ByAkc351(akc351);
		return data;
	}
	
	@Override
	public PageHelper.Page<JY_KC24> findAllAccountByPage(String begin_time,
			String end_time, int def_pageNum, int def_pageSize) {
		PageHelper.startPage(def_pageNum, def_pageSize);
		jyKc24Dao.findAllAccount(begin_time,end_time);
		PageHelper.Page<JY_KC24> list = PageHelper.endPage();
		list = convertData(list);
		return list;
	}
	
	@Override
	public Page<JY_KC24> findErrorAccountByPage(String begin_time,
			String end_time, int def_pageNum, int def_pageSize) {
		PageHelper.startPage(def_pageNum, def_pageSize);
		jyKc24Dao.findAllErrorAccount(begin_time,end_time);
		PageHelper.Page<JY_KC24> list = PageHelper.endPage();
		list = convertData(list);
		return list;
	}
	
	private List<Object> convertAxisTime(List<JK_KC02> list_kc02,
			List<JY_KC24> list_kc24) {
		List<Object> list = new ArrayList<>(list_kc02.size() + list_kc24.size());
		for (JK_KC02 kc02 : list_kc02) {
			DataOne data = new DataOne();
			data.setAac002(kc02.getAAC002());
			data.setAac003(kc02.getAAC003());
			data.setAae036(kc02.getAAE036().toLocaleString());
			data.setAae011(kc02.getAAE011());
			data.setStatus("1".equals(kc02.getYDBZ())?"有效":"无效");
			data.setAkc044(DateUtil.getTimeYMD(kc02.getAKC044()) + "至" + DateUtil.getTimeYMD(kc02.getAKC043()));
			data.setCommon("参保地   " + aa26Dao.getProvinceNameByCode(kc02.getYAB003()) + "   ->   就医地    " + aa26Dao.getProvinceNameByCode(kc02.getYAB300()));
			data.setAac004("1".equals(kc02.getAAC004())?"男":"女");
			list.add(data);
		}
		for (JY_KC24 kc24 : list_kc24) {
			if ("1".equals(kc24.getAKA135())) {
				String aae072 = kc24.getAAE072();
				String akc190 = kc24.getAKC190();
				StringBuffer status = new StringBuffer();
				//查询是否存在撤销冲正
				JY_KC24 result = jyKc24Dao.findAccount(akc190, "CX" + aae072);
				if (result != null) {
					status.append("已撤销   ");
				}
				JY_KC24 res = jyKc24Dao.findAccount(akc190, "CZ" + aae072);
				if (res != null) {
					status.append("已冲正");
				}
				DataTwo data = new DataTwo();
				data.setAac003(kc24.getAAC003());
				data.setCommon(kc24.getAKB021());
				data.setTime(DateUtil.subStrTime(kc24.getAAE036()));
				data.setAae011(kc24.getAAE011());
				data.setAkc021("1".equals(kc24.getAKC021())?"异地安置":"转诊");
				data.setAkc264(kc24.getAKC264()+"");
				data.setAab004(kc24.getAAB004()==null?"保密":kc24.getAAB004());
				data.setAka135(kc24.getAKA135()+"&"+kc24.getAKC351());
				data.setStatus("".equals(status.toString())?"正常结算":status.toString());
				list.add(data);
			}
			
		}
		return list;
	}
	@Data
	class DataOne {
		private String aac003;
		private String aac002;
		private String akc044;
		private String aae036;
		private String aae011;
		private String aac004;
		private String status;
		private String common;
	}
	@Data
	class DataTwo {
		private String aac003;
		private String common;
		private String akc021;
		private String akc264;
		private String aae011;
		private String time;
		private String aab004;
		private String aka135;
		private String akc351;
		private String status;
	}
	
}

/**
 * 现在 有10亿个int型的数字（JAVA中 int 型占4B），以及一台可用内存为1GB的机器，如何找出这10亿个数字的中位数？

中位数定义：数字排序之后，位于中间的那个数。比如将10亿个数字进行排序（位置从1到10亿），排序之后，位于第5亿个位置的那个数 就是中位数。

关于中位数，可参考：快速排序中的分割算法的解析与应用

一种方法是定义一个长度为10亿的整型数组，采用排序算法排序。但是：

10亿个数字，每个数字在内存中占4B，10亿个数字完全加载到内存中需要：10*108*4B ，约为：4GB内存。显然不能把所有的数字都装入内存。

这里，采用基于二进制位比较 和 快速排序算法中的“分割思想”来寻找中位数。具体如下：

假设10亿个数字保存在一个大文件中，依次读一部分文件到内存(不超过内存的限制：1GB)，将每个数字用二进制表示，比较二进制的最高位(第32位)，如果数字的最高位为0，则将这个数字写入 file_0文件中；如果最高位为 1，则将该数字写入file_1文件中。【这里的最高位类似于快速排序中的枢轴元素】
1 2 3 4 5 6 7 8 9
1 3 5 7 9
2 4 6
从而将10亿个数字分成了两个文件（几乎是二分的），假设 file_0文件中有 6亿 个数字，file_1文件中有 4亿 个数字。那么中位数就在 file_0 文件中，并且是 file_0 文件中所有数字排序之后的第 1亿 个数字。

【为什么呢？因为10亿个数字的中位数是10亿个数排序之后的第5亿个数。现在file_0有6亿个数，file_1有4亿个数，file_0中的数都比file_1中的数要大（最高位为符号位，file_1中的数都是负数，file_0中的数都是正数，也即这里一共只有4亿个负数，排序之后的第5亿个数一定是正数，那么排序之后的第5亿个数一定位于file_0中）】。除去4亿个负数，中位数就是6亿个正数从小到大排序之后 的第 1 亿个数。

现在，我们只需要处理 file_0 文件了（不需要再考虑file_1文件）。对于 file_0 文件，同样采取上面的措施处理：将file_0文件依次读一部分到内存(不超内存限制：1GB)，将每个数字用二进制表示，比较二进制的 次高位（第31位），如果数字的次高位为0，写入file_0_0文件中；如果次高位为1，写入file_0_1文件 中。

现假设 file_0_0文件中有3亿个数字，file_0_1中也有3亿个数字，则中位数就是：file_0_0文件中的数字从小到大排序之后的第1亿个数字。

抛弃file_0_1文件，继续对 file_0_0文件 根据 次次高位(第30位) 划分，假设此次划分的两个文件为：file_0_0_0中有0.5亿个数字，file_0_0_1中有2.5亿个数字，那么中位数就是 file_0_0_1文件中的所有数字排序之后的 第 0.5亿 个数。

......

按照上述思路，直到划分的文件可直接加载进内存时（比如划分的文件中只有5KW个数字了），就可以直接对数字进行快速排序，找出中位数了。当然，你也使用“快排的分割算法”来找出中位数(比使用快速排序要快)

总结：上面的海量数据寻找中位数，其实就是利用了“分割”思想，每次将 问题空间 大约分解成原问题空间的一半左右。（划分成两个文件，直接丢弃其中一个文件），故总的复杂度可视为O(logN) N=10亿。
 */

/*
 * 中断线程
线程的thread.interrupt()方法是中断线程，将会设置该线程的中断状态位，即设置为true，中断的结果线程是死亡、还是等待新的任务或是继续运行至下一步，
就取决于这个程序本身。线程会不时地检测这个中断标示位，以判断线程是否应该被中断（中断标示值是否为true）。它并不像stop方法那样会中断一个正在运行的线程。

判断线程是否被中断
判断某个线程是否已被发送过中断请求，请使用Thread.currentThread().isInterrupted()方法（因为它将线程中断标示位设置为true后，不会立刻
清除中断标示位，即不会将中断标设置为false），而不要使用thread.interrupted()（该方法调用后会将中断标示位清除，即重新设置为false）方法来判断，下面是线程在循环中时的中断方式：

while(!Thread.currentThread().isInterrupted() && more work to do){
    do more work
}
如何中断线程
如果一个线程处于了阻塞状态（如线程调用了thread.sleep、thread.join、thread.wait、1.5中的condition.await、以及可中断的通道上的 I/O 
操作方法后可进入阻塞状态），则在线程在检查中断标示时如果发现中断标示为true，则会在这些阻塞方法（sleep、join、wait、1.5中的condition.await及可中断的通道上的 I/O 操作方法）
调用处抛出InterruptedException异常，并且在抛出异常后立即将线程的中断标示位清除，即重新设置为false。抛出异常是为了线程从阻塞状态醒过来，并在结束线程前让程序员有足够的时间来处理中断请求。

 

注，synchronized在获锁的过程中是不能被中断的，意思是说如果产生了死锁，则不可能被中断（请参考后面的测试例子）。与synchronized功能相似的reentrantLock.lock()方法
也是一样，它也不可中断的，即如果发生死锁，那么reentrantLock.lock()方法无法终止，如果调用时被阻塞，则它一直阻塞到它获取到锁为止。
但是如果调用带超时的tryLock方法reentrantLock.tryLock(long timeout, TimeUnit unit)，那么如果线程在等待时被中断，
将抛出一个InterruptedException异常，这是一个非常有用的特性，因为它允许程序打破死锁。你也可以调用reentrantLock.lockInterruptibly()方法，
它就相当于一个超时设为无限的tryLock方法。

 

没有任何语言方面的需求一个被中断的线程应该终止。中断一个线程只是为了引起该线程的注意，被中断线程可以决定如何应对中断。某些线程非常重要，以至于它们应该不理会中断，而是在处理完抛出的异
常之后继续执行，但是更普遍的情况是，一个线程将把中断看作一个终止请求，这种线程的run方法遵循如下形式：
 * */
