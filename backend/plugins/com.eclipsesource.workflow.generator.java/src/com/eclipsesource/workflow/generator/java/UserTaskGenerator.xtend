/*******************************************************************************
 * Copyright (c) 2019-2020 EclipseSource and others.
 * 
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0 which is available at
 * https://www.eclipse.org/legal/epl-2.0, or the MIT License which is
 * available at https://opensource.org/licenses/MIT.
 * 
 * SPDX-License-Identifier: EPL-2.0 OR MIT
 ******************************************************************************/
package com.eclipsesource.workflow.generator.java

import com.eclipsesource.modelserver.coffee.model.coffee.Task
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class UserTaskGenerator {
	String sourceDirectory
	
	new(String sourceDirectory) {
		this.sourceDirectory = sourceDirectory
	}
		
	def String toFileContent(String packageName, String sourceFileName, Task task) {
		'''	
		// auto-generated stub from '«sourceFileName»' at «DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now)»
		package «packageName»;
			
		import «packageName».Abstract«JavaUtil.normalize(task.name)»;
				
		public class «JavaUtil.normalize(task.name)» extends Abstract«JavaUtil.normalize(task.name)» {
		
			@Override
			public void preExecute() {
				// TODO Add custom implementation here
		
			}
		
			@Override
			public void postExecute() {
				// TODO Add custom implementation here
		
			}
		
		}
		'''
	}
	
	def String toFileName(String packageName, String taskName) {
		'''«sourceDirectory»/«JavaUtil.getFilePath(packageName)»«JavaUtil.getJavaFileName(taskName)»'''
	}
}
