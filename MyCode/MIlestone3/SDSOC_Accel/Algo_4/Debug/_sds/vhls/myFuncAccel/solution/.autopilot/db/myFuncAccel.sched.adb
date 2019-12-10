<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="15">
<syndb class_id="0" tracking_level="0" version="0">
	<userIPLatency>-1</userIPLatency>
	<userIPName></userIPName>
	<cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
		<name>myFuncAccel</name>
		<ret_bitwidth>0</ret_bitwidth>
		<ports class_id="2" tracking_level="0" version="0">
			<count>6</count>
			<item_version>0</item_version>
			<item class_id="3" tracking_level="1" version="0" object_id="_1">
				<Value class_id="4" tracking_level="0" version="0">
					<Obj class_id="5" tracking_level="0" version="0">
						<type>1</type>
						<id>1</id>
						<name>size</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo class_id="6" tracking_level="0" version="0">
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>size</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs class_id="7" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_2">
				<Value>
					<Obj>
						<type>1</type>
						<id>2</id>
						<name>dim</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>dim</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_3">
				<Value>
					<Obj>
						<type>1</type>
						<id>3</id>
						<name>threshold</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>threshold</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>0</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_4">
				<Value>
					<Obj>
						<type>1</type>
						<id>4</id>
						<name>data0</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>data0</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_5">
				<Value>
					<Obj>
						<type>1</type>
						<id>5</id>
						<name>data1</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>data1</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_6">
				<Value>
					<Obj>
						<type>1</type>
						<id>6</id>
						<name>data2</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>data2</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<direction>1</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
		</ports>
		<nodes class_id="8" tracking_level="0" version="0">
			<count>23</count>
			<item_version>0</item_version>
			<item class_id="9" tracking_level="1" version="0" object_id="_7">
				<Value>
					<Obj>
						<type>0</type>
						<id>7</id>
						<name>threshold_read</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item class_id="10" tracking_level="0" version="0">
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second class_id="11" tracking_level="0" version="0">
									<count>1</count>
									<item_version>0</item_version>
									<item class_id="12" tracking_level="0" version="0">
										<first class_id="13" tracking_level="0" version="0">
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName>threshold</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>48</item>
					<item>49</item>
				</oprand_edges>
				<opcode>read</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>1</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_8">
				<Value>
					<Obj>
						<type>0</type>
						<id>8</id>
						<name>size_read</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName>size</originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>2</count>
					<item_version>0</item_version>
					<item>51</item>
					<item>52</item>
				</oprand_edges>
				<opcode>read</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>2</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_9">
				<Value>
					<Obj>
						<type>0</type>
						<id>9</id>
						<name>threshold_c</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>54</item>
				</oprand_edges>
				<opcode>alloca</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>3</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_10">
				<Value>
					<Obj>
						<type>0</type>
						<id>10</id>
						<name>size_c</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>55</item>
				</oprand_edges>
				<opcode>alloca</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>4</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_11">
				<Value>
					<Obj>
						<type>0</type>
						<id>27</id>
						<name>call_ret</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>512</bitwidth>
				</Value>
				<oprand_edges>
					<count>6</count>
					<item_version>0</item_version>
					<item>57</item>
					<item>58</item>
					<item>59</item>
					<item>60</item>
					<item>61</item>
					<item>62</item>
				</oprand_edges>
				<opcode>call</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>3.63</m_delay>
				<m_topoIndex>5</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_12">
				<Value>
					<Obj>
						<type>0</type>
						<id>28</id>
						<name>data0_load_loc_chann</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>63</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>6</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_13">
				<Value>
					<Obj>
						<type>0</type>
						<id>29</id>
						<name>data0_load_1_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>64</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>7</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_14">
				<Value>
					<Obj>
						<type>0</type>
						<id>30</id>
						<name>data0_load_2_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>65</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>8</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_15">
				<Value>
					<Obj>
						<type>0</type>
						<id>31</id>
						<name>data0_load_3_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>66</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>9</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_16">
				<Value>
					<Obj>
						<type>0</type>
						<id>32</id>
						<name>data0_load_4_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>67</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>10</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_17">
				<Value>
					<Obj>
						<type>0</type>
						<id>33</id>
						<name>data0_load_5_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>68</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>11</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_18">
				<Value>
					<Obj>
						<type>0</type>
						<id>34</id>
						<name>data0_load_6_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>69</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>12</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_19">
				<Value>
					<Obj>
						<type>0</type>
						<id>35</id>
						<name>data0_load_7_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>70</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>13</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_20">
				<Value>
					<Obj>
						<type>0</type>
						<id>36</id>
						<name>data0_load_8_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>71</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>14</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_21">
				<Value>
					<Obj>
						<type>0</type>
						<id>37</id>
						<name>data0_load_9_loc_cha</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>72</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>15</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_22">
				<Value>
					<Obj>
						<type>0</type>
						<id>38</id>
						<name>data0_load_10_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>73</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>16</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_23">
				<Value>
					<Obj>
						<type>0</type>
						<id>39</id>
						<name>data0_load_11_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>74</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>17</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_24">
				<Value>
					<Obj>
						<type>0</type>
						<id>40</id>
						<name>data0_load_12_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>75</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>18</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_25">
				<Value>
					<Obj>
						<type>0</type>
						<id>41</id>
						<name>data0_load_13_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>76</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>19</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_26">
				<Value>
					<Obj>
						<type>0</type>
						<id>42</id>
						<name>data0_load_14_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>77</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>20</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_27">
				<Value>
					<Obj>
						<type>0</type>
						<id>43</id>
						<name>data0_load_15_loc_ch</name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<oprand_edges>
					<count>1</count>
					<item_version>0</item_version>
					<item>78</item>
				</oprand_edges>
				<opcode>extractvalue</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>21</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_28">
				<Value>
					<Obj>
						<type>0</type>
						<id>44</id>
						<name></name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>30</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>30</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>23</count>
					<item_version>0</item_version>
					<item>80</item>
					<item>81</item>
					<item>82</item>
					<item>83</item>
					<item>84</item>
					<item>85</item>
					<item>86</item>
					<item>87</item>
					<item>88</item>
					<item>89</item>
					<item>90</item>
					<item>91</item>
					<item>92</item>
					<item>93</item>
					<item>94</item>
					<item>95</item>
					<item>96</item>
					<item>97</item>
					<item>98</item>
					<item>99</item>
					<item>100</item>
					<item>257</item>
					<item>258</item>
				</oprand_edges>
				<opcode>call</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>22</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
			<item class_id_reference="9" object_id="_29">
				<Value>
					<Obj>
						<type>0</type>
						<id>45</id>
						<name></name>
						<fileName>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</fileName>
						<fileDirectory>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</fileDirectory>
						<lineNumber>101</lineNumber>
						<contextFuncName>myFuncAccel</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item>
								<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls</first>
								<second>
									<count>1</count>
									<item_version>0</item_version>
									<item>
										<first>
											<first>/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c</first>
											<second>myFuncAccel</second>
										</first>
										<second>101</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>0</count>
					<item_version>0</item_version>
				</oprand_edges>
				<opcode>ret</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_isLCDNode>0</m_isLCDNode>
				<m_isStartOfPath>0</m_isStartOfPath>
				<m_delay>0.00</m_delay>
				<m_topoIndex>23</m_topoIndex>
				<m_clusterGroupNumber>-1</m_clusterGroupNumber>
			</item>
		</nodes>
		<consts class_id="15" tracking_level="0" version="0">
			<count>3</count>
			<item_version>0</item_version>
			<item class_id="16" tracking_level="1" version="0" object_id="_30">
				<Value>
					<Obj>
						<type>2</type>
						<id>53</id>
						<name>empty</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>32</bitwidth>
				</Value>
				<const_type>0</const_type>
				<content>1</content>
			</item>
			<item class_id_reference="16" object_id="_31">
				<Value>
					<Obj>
						<type>2</type>
						<id>56</id>
						<name>Block_codeRepl49_pro</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>512</bitwidth>
				</Value>
				<const_type>6</const_type>
				<content>&lt;constant:Block_codeRepl49_pro&gt;</content>
			</item>
			<item class_id_reference="16" object_id="_32">
				<Value>
					<Obj>
						<type>2</type>
						<id>79</id>
						<name>Loop_sizeLoop_proc</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<const_type>6</const_type>
				<content>&lt;constant:Loop_sizeLoop_proc&gt;</content>
			</item>
		</consts>
		<blocks class_id="17" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="18" tracking_level="1" version="0" object_id="_33">
				<Obj>
					<type>3</type>
					<id>46</id>
					<name>myFuncAccel</name>
					<fileName></fileName>
					<fileDirectory></fileDirectory>
					<lineNumber>0</lineNumber>
					<contextFuncName></contextFuncName>
					<inlineStackInfo>
						<count>0</count>
						<item_version>0</item_version>
					</inlineStackInfo>
					<originalName></originalName>
					<rtlName></rtlName>
					<coreName></coreName>
				</Obj>
				<node_objs>
					<count>23</count>
					<item_version>0</item_version>
					<item>7</item>
					<item>8</item>
					<item>9</item>
					<item>10</item>
					<item>27</item>
					<item>28</item>
					<item>29</item>
					<item>30</item>
					<item>31</item>
					<item>32</item>
					<item>33</item>
					<item>34</item>
					<item>35</item>
					<item>36</item>
					<item>37</item>
					<item>38</item>
					<item>39</item>
					<item>40</item>
					<item>41</item>
					<item>42</item>
					<item>43</item>
					<item>44</item>
					<item>45</item>
				</node_objs>
			</item>
		</blocks>
		<edges class_id="19" tracking_level="0" version="0">
			<count>49</count>
			<item_version>0</item_version>
			<item class_id="20" tracking_level="1" version="0" object_id="_34">
				<id>49</id>
				<edge_type>1</edge_type>
				<source_obj>3</source_obj>
				<sink_obj>7</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_35">
				<id>52</id>
				<edge_type>1</edge_type>
				<source_obj>1</source_obj>
				<sink_obj>8</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_36">
				<id>54</id>
				<edge_type>1</edge_type>
				<source_obj>53</source_obj>
				<sink_obj>9</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_37">
				<id>55</id>
				<edge_type>1</edge_type>
				<source_obj>53</source_obj>
				<sink_obj>10</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_38">
				<id>57</id>
				<edge_type>1</edge_type>
				<source_obj>56</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_39">
				<id>58</id>
				<edge_type>1</edge_type>
				<source_obj>4</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_40">
				<id>59</id>
				<edge_type>1</edge_type>
				<source_obj>8</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_41">
				<id>60</id>
				<edge_type>1</edge_type>
				<source_obj>7</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_42">
				<id>61</id>
				<edge_type>1</edge_type>
				<source_obj>10</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_43">
				<id>62</id>
				<edge_type>1</edge_type>
				<source_obj>9</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_44">
				<id>63</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>28</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_45">
				<id>64</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>29</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_46">
				<id>65</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>30</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_47">
				<id>66</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>31</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_48">
				<id>67</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>32</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_49">
				<id>68</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>33</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_50">
				<id>69</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>34</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_51">
				<id>70</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>35</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_52">
				<id>71</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>36</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_53">
				<id>72</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>37</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_54">
				<id>73</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>38</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_55">
				<id>74</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>39</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_56">
				<id>75</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>40</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_57">
				<id>76</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>41</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_58">
				<id>77</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>42</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_59">
				<id>78</id>
				<edge_type>1</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>43</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_60">
				<id>80</id>
				<edge_type>1</edge_type>
				<source_obj>79</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_61">
				<id>81</id>
				<edge_type>1</edge_type>
				<source_obj>10</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_62">
				<id>82</id>
				<edge_type>1</edge_type>
				<source_obj>5</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_63">
				<id>83</id>
				<edge_type>1</edge_type>
				<source_obj>28</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_64">
				<id>84</id>
				<edge_type>1</edge_type>
				<source_obj>29</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_65">
				<id>85</id>
				<edge_type>1</edge_type>
				<source_obj>30</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_66">
				<id>86</id>
				<edge_type>1</edge_type>
				<source_obj>31</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_67">
				<id>87</id>
				<edge_type>1</edge_type>
				<source_obj>9</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_68">
				<id>88</id>
				<edge_type>1</edge_type>
				<source_obj>32</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_69">
				<id>89</id>
				<edge_type>1</edge_type>
				<source_obj>33</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_70">
				<id>90</id>
				<edge_type>1</edge_type>
				<source_obj>34</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_71">
				<id>91</id>
				<edge_type>1</edge_type>
				<source_obj>35</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_72">
				<id>92</id>
				<edge_type>1</edge_type>
				<source_obj>36</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_73">
				<id>93</id>
				<edge_type>1</edge_type>
				<source_obj>37</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_74">
				<id>94</id>
				<edge_type>1</edge_type>
				<source_obj>38</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_75">
				<id>95</id>
				<edge_type>1</edge_type>
				<source_obj>39</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_76">
				<id>96</id>
				<edge_type>1</edge_type>
				<source_obj>40</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_77">
				<id>97</id>
				<edge_type>1</edge_type>
				<source_obj>41</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_78">
				<id>98</id>
				<edge_type>1</edge_type>
				<source_obj>42</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_79">
				<id>99</id>
				<edge_type>1</edge_type>
				<source_obj>43</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_80">
				<id>100</id>
				<edge_type>1</edge_type>
				<source_obj>6</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_81">
				<id>257</id>
				<edge_type>4</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_82">
				<id>258</id>
				<edge_type>4</edge_type>
				<source_obj>27</source_obj>
				<sink_obj>44</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
		</edges>
	</cdfg>
	<cdfg_regions class_id="21" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="22" tracking_level="1" version="0" object_id="_83">
			<mId>1</mId>
			<mTag>myFuncAccel</mTag>
			<mType>0</mType>
			<sub_regions>
				<count>0</count>
				<item_version>0</item_version>
			</sub_regions>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>46</item>
			</basic_blocks>
			<mII>-1</mII>
			<mDepth>-1</mDepth>
			<mMinTripCount>-1</mMinTripCount>
			<mMaxTripCount>-1</mMaxTripCount>
			<mMinLatency>-1</mMinLatency>
			<mMaxLatency>-1</mMaxLatency>
			<mIsDfPipe>1</mIsDfPipe>
			<mDfPipe class_id="23" tracking_level="1" version="0" object_id="_84">
				<port_list class_id="24" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</port_list>
				<process_list class_id="25" tracking_level="0" version="0">
					<count>2</count>
					<item_version>0</item_version>
					<item class_id="26" tracking_level="1" version="0" object_id="_85">
						<type>0</type>
						<name>Block_codeRepl49_pro_U0</name>
						<ssdmobj_id>27</ssdmobj_id>
						<pins class_id="27" tracking_level="0" version="0">
							<count>21</count>
							<item_version>0</item_version>
							<item class_id="28" tracking_level="1" version="0" object_id="_86">
								<port class_id="29" tracking_level="1" version="0" object_id="_87">
									<name>data0</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id="30" tracking_level="1" version="0" object_id="_88">
									<type>0</type>
									<name>Block_codeRepl49_pro_U0</name>
									<ssdmobj_id>27</ssdmobj_id>
								</inst>
							</item>
							<item class_id_reference="28" object_id="_89">
								<port class_id_reference="29" object_id="_90">
									<name>size</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_91">
								<port class_id_reference="29" object_id="_92">
									<name>threshold</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_93">
								<port class_id_reference="29" object_id="_94">
									<name>size_out</name>
									<dir>0</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_95">
								<port class_id_reference="29" object_id="_96">
									<name>threshold_out</name>
									<dir>0</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_97">
								<port class_id_reference="29" object_id="_98">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_99">
								<port class_id_reference="29" object_id="_100">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_101">
								<port class_id_reference="29" object_id="_102">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_103">
								<port class_id_reference="29" object_id="_104">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_105">
								<port class_id_reference="29" object_id="_106">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_107">
								<port class_id_reference="29" object_id="_108">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_109">
								<port class_id_reference="29" object_id="_110">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_111">
								<port class_id_reference="29" object_id="_112">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_113">
								<port class_id_reference="29" object_id="_114">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_115">
								<port class_id_reference="29" object_id="_116">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_117">
								<port class_id_reference="29" object_id="_118">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_119">
								<port class_id_reference="29" object_id="_120">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_121">
								<port class_id_reference="29" object_id="_122">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_123">
								<port class_id_reference="29" object_id="_124">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_125">
								<port class_id_reference="29" object_id="_126">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
							<item class_id_reference="28" object_id="_127">
								<port class_id_reference="29" object_id="_128">
									<name>ap_return</name>
									<dir>3</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_88"></inst>
							</item>
						</pins>
					</item>
					<item class_id_reference="26" object_id="_129">
						<type>0</type>
						<name>Loop_sizeLoop_proc_U0</name>
						<ssdmobj_id>44</ssdmobj_id>
						<pins>
							<count>20</count>
							<item_version>0</item_version>
							<item class_id_reference="28" object_id="_130">
								<port class_id_reference="29" object_id="_131">
									<name>size</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id="_132">
									<type>0</type>
									<name>Loop_sizeLoop_proc_U0</name>
									<ssdmobj_id>44</ssdmobj_id>
								</inst>
							</item>
							<item class_id_reference="28" object_id="_133">
								<port class_id_reference="29" object_id="_134">
									<name>data1</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_135">
								<port class_id_reference="29" object_id="_136">
									<name>p_read</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_137">
								<port class_id_reference="29" object_id="_138">
									<name>p_read1</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_139">
								<port class_id_reference="29" object_id="_140">
									<name>p_read2</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_141">
								<port class_id_reference="29" object_id="_142">
									<name>p_read3</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_143">
								<port class_id_reference="29" object_id="_144">
									<name>threshold</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_145">
								<port class_id_reference="29" object_id="_146">
									<name>p_read4</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_147">
								<port class_id_reference="29" object_id="_148">
									<name>p_read5</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_149">
								<port class_id_reference="29" object_id="_150">
									<name>p_read6</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_151">
								<port class_id_reference="29" object_id="_152">
									<name>p_read7</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_153">
								<port class_id_reference="29" object_id="_154">
									<name>p_read8</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_155">
								<port class_id_reference="29" object_id="_156">
									<name>p_read9</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_157">
								<port class_id_reference="29" object_id="_158">
									<name>p_read10</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_159">
								<port class_id_reference="29" object_id="_160">
									<name>p_read11</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_161">
								<port class_id_reference="29" object_id="_162">
									<name>p_read12</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_163">
								<port class_id_reference="29" object_id="_164">
									<name>p_read13</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_165">
								<port class_id_reference="29" object_id="_166">
									<name>p_read14</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_167">
								<port class_id_reference="29" object_id="_168">
									<name>p_read15</name>
									<dir>3</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
							<item class_id_reference="28" object_id="_169">
								<port class_id_reference="29" object_id="_170">
									<name>data2</name>
									<dir>0</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_132"></inst>
							</item>
						</pins>
					</item>
				</process_list>
				<channel_list class_id="31" tracking_level="0" version="0">
					<count>18</count>
					<item_version>0</item_version>
					<item class_id="32" tracking_level="1" version="0" object_id="_171">
						<type>1</type>
						<name>size_c</name>
						<ssdmobj_id>10</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_172">
							<port class_id_reference="29" object_id="_173">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_174">
							<port class_id_reference="29" object_id="_175">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_176">
						<type>1</type>
						<name>threshold_c</name>
						<ssdmobj_id>9</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_177">
							<port class_id_reference="29" object_id="_178">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_179">
							<port class_id_reference="29" object_id="_180">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_181">
						<type>1</type>
						<name>data0_load_loc_chann</name>
						<ssdmobj_id>28</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_182">
							<port class_id_reference="29" object_id="_183">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_184">
							<port class_id_reference="29" object_id="_185">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_186">
						<type>1</type>
						<name>data0_load_1_loc_cha</name>
						<ssdmobj_id>29</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_187">
							<port class_id_reference="29" object_id="_188">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_189">
							<port class_id_reference="29" object_id="_190">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_191">
						<type>1</type>
						<name>data0_load_2_loc_cha</name>
						<ssdmobj_id>30</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_192">
							<port class_id_reference="29" object_id="_193">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_194">
							<port class_id_reference="29" object_id="_195">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_196">
						<type>1</type>
						<name>data0_load_3_loc_cha</name>
						<ssdmobj_id>31</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_197">
							<port class_id_reference="29" object_id="_198">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_199">
							<port class_id_reference="29" object_id="_200">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_201">
						<type>1</type>
						<name>data0_load_4_loc_cha</name>
						<ssdmobj_id>32</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_202">
							<port class_id_reference="29" object_id="_203">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_204">
							<port class_id_reference="29" object_id="_205">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_206">
						<type>1</type>
						<name>data0_load_5_loc_cha</name>
						<ssdmobj_id>33</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_207">
							<port class_id_reference="29" object_id="_208">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_209">
							<port class_id_reference="29" object_id="_210">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_211">
						<type>1</type>
						<name>data0_load_6_loc_cha</name>
						<ssdmobj_id>34</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_212">
							<port class_id_reference="29" object_id="_213">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_214">
							<port class_id_reference="29" object_id="_215">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_216">
						<type>1</type>
						<name>data0_load_7_loc_cha</name>
						<ssdmobj_id>35</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_217">
							<port class_id_reference="29" object_id="_218">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_219">
							<port class_id_reference="29" object_id="_220">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_221">
						<type>1</type>
						<name>data0_load_8_loc_cha</name>
						<ssdmobj_id>36</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_222">
							<port class_id_reference="29" object_id="_223">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_224">
							<port class_id_reference="29" object_id="_225">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_226">
						<type>1</type>
						<name>data0_load_9_loc_cha</name>
						<ssdmobj_id>37</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_227">
							<port class_id_reference="29" object_id="_228">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_229">
							<port class_id_reference="29" object_id="_230">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_231">
						<type>1</type>
						<name>data0_load_10_loc_ch</name>
						<ssdmobj_id>38</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_232">
							<port class_id_reference="29" object_id="_233">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_234">
							<port class_id_reference="29" object_id="_235">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_236">
						<type>1</type>
						<name>data0_load_11_loc_ch</name>
						<ssdmobj_id>39</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_237">
							<port class_id_reference="29" object_id="_238">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_239">
							<port class_id_reference="29" object_id="_240">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_241">
						<type>1</type>
						<name>data0_load_12_loc_ch</name>
						<ssdmobj_id>40</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_242">
							<port class_id_reference="29" object_id="_243">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_244">
							<port class_id_reference="29" object_id="_245">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_246">
						<type>1</type>
						<name>data0_load_13_loc_ch</name>
						<ssdmobj_id>41</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_247">
							<port class_id_reference="29" object_id="_248">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_249">
							<port class_id_reference="29" object_id="_250">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_251">
						<type>1</type>
						<name>data0_load_14_loc_ch</name>
						<ssdmobj_id>42</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_252">
							<port class_id_reference="29" object_id="_253">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_254">
							<port class_id_reference="29" object_id="_255">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
					<item class_id_reference="32" object_id="_256">
						<type>1</type>
						<name>data0_load_15_loc_ch</name>
						<ssdmobj_id>43</ssdmobj_id>
						<ctype>0</ctype>
						<depth>2</depth>
						<bitwidth>32</bitwidth>
						<source class_id_reference="28" object_id="_257">
							<port class_id_reference="29" object_id="_258">
								<name>in</name>
								<dir>3</dir>
								<type>0</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_88"></inst>
						</source>
						<sink class_id_reference="28" object_id="_259">
							<port class_id_reference="29" object_id="_260">
								<name>out</name>
								<dir>3</dir>
								<type>1</type>
							</port>
							<inst class_id_reference="30" object_id_reference="_132"></inst>
						</sink>
					</item>
				</channel_list>
				<net_list class_id="33" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</net_list>
			</mDfPipe>
		</item>
	</cdfg_regions>
	<fsm class_id="-1"></fsm>
	<res class_id="-1"></res>
	<node_label_latency class_id="36" tracking_level="0" version="0">
		<count>23</count>
		<item_version>0</item_version>
		<item class_id="37" tracking_level="0" version="0">
			<first>7</first>
			<second class_id="38" tracking_level="0" version="0">
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>8</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>9</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>10</first>
			<second>
				<first>0</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>27</first>
			<second>
				<first>0</first>
				<second>1</second>
			</second>
		</item>
		<item>
			<first>28</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>29</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>30</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>31</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>32</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>33</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>34</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>35</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>36</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>37</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>38</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>39</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>40</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>41</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>42</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>43</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
		<item>
			<first>44</first>
			<second>
				<first>2</first>
				<second>1</second>
			</second>
		</item>
		<item>
			<first>45</first>
			<second>
				<first>3</first>
				<second>0</second>
			</second>
		</item>
	</node_label_latency>
	<bblk_ent_exit class_id="39" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="40" tracking_level="0" version="0">
			<first>46</first>
			<second class_id="41" tracking_level="0" version="0">
				<first>0</first>
				<second>3</second>
			</second>
		</item>
	</bblk_ent_exit>
	<regions class_id="42" tracking_level="0" version="0">
		<count>2</count>
		<item_version>0</item_version>
		<item class_id="43" tracking_level="1" version="0" object_id="_261">
			<region_name>myFuncAccel</region_name>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>46</item>
			</basic_blocks>
			<nodes>
				<count>39</count>
				<item_version>0</item_version>
				<item>7</item>
				<item>8</item>
				<item>9</item>
				<item>10</item>
				<item>11</item>
				<item>12</item>
				<item>13</item>
				<item>14</item>
				<item>15</item>
				<item>16</item>
				<item>17</item>
				<item>18</item>
				<item>19</item>
				<item>20</item>
				<item>21</item>
				<item>22</item>
				<item>23</item>
				<item>24</item>
				<item>25</item>
				<item>26</item>
				<item>27</item>
				<item>28</item>
				<item>29</item>
				<item>30</item>
				<item>31</item>
				<item>32</item>
				<item>33</item>
				<item>34</item>
				<item>35</item>
				<item>36</item>
				<item>37</item>
				<item>38</item>
				<item>39</item>
				<item>40</item>
				<item>41</item>
				<item>42</item>
				<item>43</item>
				<item>44</item>
				<item>45</item>
			</nodes>
			<anchor_node>-1</anchor_node>
			<region_type>2</region_type>
			<interval>0</interval>
			<pipe_depth>0</pipe_depth>
		</item>
		<item class_id_reference="43" object_id="_262">
			<region_name>myFuncAccel</region_name>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>46</item>
			</basic_blocks>
			<nodes>
				<count>39</count>
				<item_version>0</item_version>
				<item>7</item>
				<item>8</item>
				<item>9</item>
				<item>10</item>
				<item>11</item>
				<item>12</item>
				<item>13</item>
				<item>14</item>
				<item>15</item>
				<item>16</item>
				<item>17</item>
				<item>18</item>
				<item>19</item>
				<item>20</item>
				<item>21</item>
				<item>22</item>
				<item>23</item>
				<item>24</item>
				<item>25</item>
				<item>26</item>
				<item>27</item>
				<item>28</item>
				<item>29</item>
				<item>30</item>
				<item>31</item>
				<item>32</item>
				<item>33</item>
				<item>34</item>
				<item>35</item>
				<item>36</item>
				<item>37</item>
				<item>38</item>
				<item>39</item>
				<item>40</item>
				<item>41</item>
				<item>42</item>
				<item>43</item>
				<item>44</item>
				<item>45</item>
			</nodes>
			<anchor_node>-1</anchor_node>
			<region_type>16</region_type>
			<interval>0</interval>
			<pipe_depth>0</pipe_depth>
		</item>
	</regions>
	<dp_fu_nodes class_id="44" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes>
	<dp_fu_nodes_expression class_id="45" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_expression>
	<dp_fu_nodes_module>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_module>
	<dp_fu_nodes_io>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_io>
	<return_ports>
		<count>0</count>
		<item_version>0</item_version>
	</return_ports>
	<dp_mem_port_nodes class_id="46" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_mem_port_nodes>
	<dp_reg_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_nodes>
	<dp_regname_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_nodes>
	<dp_reg_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_phi>
	<dp_regname_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_phi>
	<dp_port_io_nodes class_id="47" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_port_io_nodes>
	<port2core class_id="48" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</port2core>
	<node2core>
		<count>0</count>
		<item_version>0</item_version>
	</node2core>
</syndb>
</boost_serialization>

