package com.pas.cloud.web;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class Process {
	private String name;
	
	private List<Process> children;

	
	public Process() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Process> getChildren() {
		return children;
	}

	public void setChildren(List<Process> children) {
		this.children = children;
	}
	
//	public Process initFromDumpString(String dump){
//		String[] children = dump.split("\\n");
//		Process root = new Process();
//		root.setName(children[1]);
//		List<Process> childrenList = new ArrayList<Process>();
//		List<Integer> subPosition =new ArrayList<Integer>();
//		for(int i=2;i<children.length;i++){
//			String childString=children[i];
//			if(childString.startsWith("├─ ")||childString.startsWith("└─ ")){
//				children[i]=children[i].replaceFirst("├─ ", "\n").replaceFirst("└─ ", "\n");
//				subPosition.add(i);
//			}else if(childString.startsWith("│  ")||childString.startsWith(" ")){
//				children[i]=children[i].replaceFirst("│  ", "\n");
//			}
//		}
//		//get sub array
//		List<String> subTree = new ArrayList<String>();
//		for(int i=0;i<subPosition.size();i++){
//			int start = subPosition.get(i);
//			int end = (i+1)>=subPosition.size()? children.length: subPosition.get(i+1);
//			String subChildStr="";
//			for(int j = start;j<end;j++){
//				subChildStr+=children[j];
//			}
//			subTree.add(subChildStr);
//		}
//
//		for(String sub :subTree){
//			Process processChild;
//			if(sub.split("(├─ )|(└─ )").length>1){
//				processChild=this.initFromDumpString(sub);
//			}else{
//				processChild=new Process();
//				processChild.setName(sub);
//			}
//			childrenList.add(processChild);
//		}
//		root.setChildren(childrenList);
//		
//		return root;
//	}

	public Process initFromDumpString(String dump){
		String[] dumpArr = dump.split("(├─ )|(└─ )");
		List<String> nodeNames = new ArrayList<String>();//节点名称
		nodeNames.add(dumpArr[0].replaceAll("\n", "").trim());
		for(String nodeName:dumpArr){
			if(!nodeName.startsWith("\n")){
				nodeNames.add(nodeName.replaceAll("((\\n)|(\\│))", "").trim());
			}
		}
		
		for(String nodeName : nodeNames){
			dump=dump.replaceAll(nodeName, "N");
		}
		char[] dumpCharArray = dump.toCharArray();
		
		List<Integer> nodeIndexes = new ArrayList<Integer>();//节点index
		List<Integer> newLineIndexes = new ArrayList<Integer>();//换行符index
		List<Integer> levelValues = new ArrayList<Integer>();//节点级值
//		TreeMap<Integer,> map = new TreeMap();
		for(int i=0;i<dumpCharArray.length;i++){
			char c=dumpCharArray[i];
			if(c=='N'){
				nodeIndexes.add(i);
			}
			if(c=='\n'){
				newLineIndexes.add(i);
			}
		}
		
		for(int i=0;i<nodeIndexes.size();i++){
			int levelValue = nodeIndexes.get(i).intValue()-newLineIndexes.get(i).intValue();
			levelValues.add(levelValue);
		}

		Process root = new Process();
		List<Process> children = new ArrayList<Process>();
		for(int i=0;i<levelValues.size();i++){
			if(i==0){
				root.setName(nodeNames.get(i));
				continue;
			}
			int levelValue = levelValues.get(i);
			int nextLevel;//levelValue的直接下级的
			for(int j=i+1;j<levelValues.size();j++){
				int nextLevelValue = levelValues.get(j);
				if(levelValue==nextLevelValue){//没有子级
					continue;
				}else if(levelValue<nextLevelValue){
					
				}
			}
		}
		
		
		System.out.println(dump);
		
		return null;
	}
	
}
