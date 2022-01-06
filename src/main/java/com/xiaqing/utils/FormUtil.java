package com.xiaqing.utils;

import java.lang.reflect.InvocationTargetException;

import jakarta.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil {
	
	public static <T> T toModel(Class<T> clazz, HttpServletRequest request){
		T object = null;
		try {
			object = clazz.getDeclaredConstructor().newInstance();
			BeanUtils.populate(object, request.getParameterMap());
		} catch (IllegalArgumentException | NoSuchMethodException | SecurityException |IllegalAccessException |InvocationTargetException |InstantiationException e) {
			System.out.print(e.getMessage());
		}
		return object;
	}
}
