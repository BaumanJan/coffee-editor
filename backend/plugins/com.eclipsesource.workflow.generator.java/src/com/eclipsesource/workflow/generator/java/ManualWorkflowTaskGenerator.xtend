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

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class ManualWorkflowTaskGenerator {
	String sourceDirectory
	
	new(String sourceDirectory) {
		this.sourceDirectory = sourceDirectory
	}
	
	def String toFileName(String packageName) {
		'''«sourceDirectory»/«JavaUtil.getFilePath(packageName)»library/«JavaUtil.getJavaFileName("ManualWorkflowTask")»'''
	}

	def String toFileContent(String packageName) {
		'''
			// auto-generated at «DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now)»
			package «packageName».library;
			
			public abstract class ManualWorkflowTask extends WorkflowTask {
				public abstract String getActor();
			}
		'''
	}
}
