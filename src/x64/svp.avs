# SVPflow plugin for PotPlayer
# Check https://www.svp-team.com/wiki/Manual:SVPflow for more details
# This script was created by zub35 and 7sh3

SetMemoryMax(2700)
global threads = (gpu>=1) ? 7 : 5

LoadPlugin("svpflow1.dll")
LoadPlugin("svpflow2.dll")

SetFilterMTMode("DEFAULT_MT_MODE",2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("potplayer_source",3)

potplayer_source()

gpuid = (gpu==2) ? "gpuid:21" : "gpuid:0"

fps == 2 ? eval("""
rate = "num:2,den:1"
""") : fps == 3 ? eval("""
rate = "num:3,den:1"
""") : fps == 4 ? eval("""
rate = "num:4,den:1"
""") : fps == 5 ? eval("""
rate = "num:5,den:1"
""") : fps >= 50 ? eval("""
rate = "num:"+String(ContinuedNumerator(fps/Framerate,limit=10))+",den:"+String(ContinuedDenominator(fps/Framerate,limit=10))
""") : eval("""
rate = "num:1,den:1"
""")

fim == 1 ? eval("""
scene = (bf==1) ? "blend:true,mode:1" : "mode:1"
""") : fim == 2 ? eval("""
scene = (bf==1) ? "blend:true,mode:3" : "mode:3"
""") : fim == 3 ? eval("""
scene = (bf==1) ? "blend:true,mode:0" : "mode:0"
""") : eval("""
scene = (bf==1) ? "blend:true,limits:{m1:0,m2:0}" : "limits:{m1:0,m2:0}"
""")

alg == 1 ? eval("""
algo = (gpu>=1) ? "algo:11" : "algo:11,block:true"
""") : alg == 2 ? eval("""
algo = (gpu>=1) ? "algo:21" : "algo:21,block:true"
""") : alg == 3 ? eval("""
algo = (gpu>=1) ? "algo:23" : "algo:23,block:true"
""") : eval("""
algo = "algo:13"
""")

mask = (gpu>=1) ? "area:50" : alg == 1 ? "cover:0" : alg == 2 ? "cover:0" : alg == 3 ? "cover:0" : ""

distance = "distance:-1,"

penalty = ",penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4"

svp == 1 ? eval("""
super_params_gpu_sd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : svp == 2 ? eval("""
super_params_gpu_sd = "{pel:2,scale:{up:0},gpu:1}"
""") : svp == 3 ? eval("""
super_params_gpu_sd = "{pel:2,scale:{up:0},gpu:1}"
""") : eval("""
super_params_gpu_sd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""")
svp == 1 ? eval("""
super_params_cpu_sd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : svp == 2 ? eval("""
super_params_cpu_sd = "{pel:2,scale:{up:2},gpu:0}"
""") : svp == 3 ? eval("""
super_params_cpu_sd = "{pel:2,scale:{up:2},gpu:0}"
""") : eval("""
super_params_cpu_sd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""")

svp == 1 ? eval("""
analyse_params_gpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_gpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""},refine:[{}]}"
""") : svp == 3 ? eval("""
analyse_params_gpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""},refine:[{thsad:250}]}"
""") : eval("""
analyse_params_gpu_sd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")
svp == 1 ? eval("""
analyse_params_cpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_cpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""},refine:[{}]}"
""") : svp == 3 ? eval("""
analyse_params_cpu_sd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""},refine:[{thsad:250}]}"
""") : eval("""
analyse_params_cpu_sd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")

svp == 1 ? eval("""
smoothfps_params_gpu_sd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_gpu_sd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_gpu_sd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_gpu_sd = "{"""+gpuid+""",rate:{"""+rate+"""},algo:23,mask:{area:50},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")
svp == 1 ? eval("""
smoothfps_params_cpu_sd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_cpu_sd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_cpu_sd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_cpu_sd = "{rate:{"""+rate+"""},block:true,algo:23,mask:{cover:0},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")

svp == 1 ? eval("""
super_params_gpu_hd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : svp == 2 ? eval("""
super_params_gpu_hd = "{pel:2,scale:{up:0},gpu:1}"
""") : svp == 3 ? eval("""
super_params_gpu_hd = "{pel:2,scale:{up:0},gpu:1}"
""") : eval("""
super_params_gpu_hd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""")
svp == 1 ? eval("""
super_params_cpu_hd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : svp == 2 ? eval("""
super_params_cpu_hd = "{pel:2,scale:{up:2},gpu:0}"
""") : svp == 3 ? eval("""
super_params_cpu_hd = "{pel:2,scale:{up:2},gpu:0}"
""") : eval("""
super_params_cpu_hd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""")

svp == 1 ? eval("""
analyse_params_gpu_hd = "{block:{overlap:0},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_gpu_hd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_gpu_hd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""},refine:[{thsad:250}]}"
""") : eval("""
analyse_params_gpu_hd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")
svp == 1 ? eval("""
analyse_params_cpu_hd = "{block:{overlap:0},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_cpu_hd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_cpu_hd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""},refine:[{thsad:250}]}"
""") : eval("""
analyse_params_cpu_hd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")

svp == 1 ? eval("""
smoothfps_params_gpu_hd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_gpu_hd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_gpu_hd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_gpu_hd = "{"""+gpuid+""",rate:{"""+rate+"""},algo:23,mask:{area:50},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")
svp == 1 ? eval("""
smoothfps_params_cpu_hd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_cpu_hd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_cpu_hd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_cpu_hd = "{rate:{"""+rate+"""},block:true,algo:23,mask:{cover:0},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")

svp == 1 ? eval("""
super_params_gpu_fhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : svp == 2 ? eval("""
super_params_gpu_fhd = "{pel:2,scale:{up:0},gpu:1}"
""") : svp == 3 ? eval("""
super_params_gpu_fhd = "{pel:2,scale:{up:0},gpu:1}"
""") : eval("""
super_params_gpu_fhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""")
svp == 1 ? eval("""
super_params_cpu_fhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : svp == 2 ? eval("""
super_params_cpu_fhd = "{pel:2,scale:{up:2},gpu:0}"
""") : svp == 3 ? eval("""
super_params_cpu_fhd = "{pel:2,scale:{up:2},gpu:0}"
""") : eval("""
super_params_cpu_fhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""")

svp == 1 ? eval("""
analyse_params_gpu_fhd = "{block:{w:32,overlap:0},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_gpu_fhd = "{block:{overlap:0},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_gpu_fhd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : eval("""
analyse_params_gpu_fhd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")
svp == 1 ? eval("""
analyse_params_cpu_fhd = "{block:{w:32,overlap:0},main:{search:{coarse:{"""+distance+"""bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_cpu_fhd = "{block:{overlap:0},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_cpu_fhd = "{block:{},main:{search:{coarse:{"""+distance+"""bad:{sad:2000}}}"""+penalty+"""}}"
""") : eval("""
analyse_params_cpu_fhd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")

svp == 1 ? eval("""
smoothfps_params_gpu_fhd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_gpu_fhd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_gpu_fhd = "{"""+gpuid+""",rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_gpu_fhd = "{"""+gpuid+""",rate:{"""+rate+"""},algo:23,mask:{area:50},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")
svp == 1 ? eval("""
smoothfps_params_cpu_fhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_cpu_fhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_cpu_fhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_cpu_fhd = "{rate:{"""+rate+"""},block:true,algo:23,mask:{cover:0},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")

svp == 1 ? eval("""
super_params_gpu_uhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : svp == 2 ? eval("""
super_params_gpu_uhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : svp == 3 ? eval("""
super_params_gpu_uhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""") : eval("""
super_params_gpu_uhd = "{pel:1,scale:{up:0},gpu:1,full:false}"
""")
svp == 1 ? eval("""
super_params_cpu_uhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : svp == 2 ? eval("""
super_params_cpu_uhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : svp == 3 ? eval("""
super_params_cpu_uhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""") : eval("""
super_params_cpu_uhd = "{pel:1,scale:{up:2},gpu:0,full:false}"
""")

svp == 1 ? eval("""
analyse_params_gpu_uhd = "{block:{w:32,overlap:0},main:{search:{coarse:{bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_gpu_uhd = "{block:{w:32,overlap:0},main:{search:{coarse:{bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_gpu_uhd = "{block:{overlap:0},main:{search:{coarse:{bad:{sad:2000}}}"""+penalty+"""}}"
""") : eval("""
analyse_params_gpu_uhd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")
svp == 1 ? eval("""
analyse_params_cpu_uhd = "{block:{w:32,overlap:0},main:{search:{coarse:{bad:{}}}"""+penalty+"""}}"
""") : svp == 2 ? eval("""
analyse_params_cpu_uhd = "{block:{w:32,overlap:0},main:{search:{coarse:{bad:{sad:2000}}}"""+penalty+"""}}"
""") : svp == 3 ? eval("""
analyse_params_cpu_uhd = "{block:{overlap:0},main:{search:{coarse:{bad:{sad:2000}}}"""+penalty+"""}}"
""") : eval("""
analyse_params_cpu_uhd = "{block:{},main:{search:{coarse:{distance:-1,bad:{}}},penalty:{plevel:1.7,lsad:6000,pnew:10,pglobal:0,pzero:10,pnbour:10,prev:10},levels:4},refine:[{}]}"
""")

svp == 1 ? eval("""
smoothfps_params_gpu_uhd = "{"""+gpuid+""",cubic:0,linear:false,rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_gpu_uhd = "{"""+gpuid+""",cubic:0,linear:false,rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_gpu_uhd = "{"""+gpuid+""",cubic:0,linear:false,rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_gpu_uhd = "{"""+gpuid+""",cubic:0,linear:false,rate:{"""+rate+"""},algo:23,mask:{area:50},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")
svp == 1 ? eval("""
smoothfps_params_cpu_uhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 2 ? eval("""
smoothfps_params_cpu_uhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : svp == 3 ? eval("""
smoothfps_params_cpu_uhd = "{rate:{"""+rate+"""},"""+algo+""",mask:{"""+mask+"""},scene:{"""+scene+"""}}"
""") : eval("""
smoothfps_params_cpu_uhd = "{rate:{"""+rate+"""},block:true,algo:23,mask:{cover:0},scene:{blend:true,force13:true,limits:{scene:6000,zero:10,blocks:30}}}"
""")

z = width * height

z <= 450000 ? eval("""
global super_params = (gpu>=1) ? """"+super_params_gpu_sd+"""" : """"+super_params_cpu_sd+""""
global analyse_params = (gpu>=1) ? """"+analyse_params_gpu_sd+"""" : """"+analyse_params_cpu_sd+""""
global smoothfps_params = (gpu>=1) ? """"+smoothfps_params_gpu_sd+"""" : """"+smoothfps_params_cpu_sd+""""
""") : z <= 1100000 ? eval("""
global super_params = (gpu>=1) ? """"+super_params_gpu_hd+"""" : """"+super_params_cpu_hd+""""
global analyse_params = (gpu>=1) ? """"+analyse_params_gpu_hd+"""" : """"+analyse_params_cpu_hd+""""
global smoothfps_params = (gpu>=1) ? """"+smoothfps_params_gpu_hd+"""" : """"+smoothfps_params_cpu_hd+""""
""") : z <= 2305000 ? eval("""
global super_params = (gpu>=1) ? """"+super_params_gpu_fhd+"""" : """"+super_params_cpu_fhd+""""
global analyse_params = (gpu>=1) ? """"+analyse_params_gpu_fhd+"""" : """"+analyse_params_cpu_fhd+""""
global smoothfps_params = (gpu>=1) ? """"+smoothfps_params_gpu_fhd+"""" : """"+smoothfps_params_cpu_fhd+""""
""") : eval("""
global super_params = (gpu>=1) ? """"+super_params_gpu_uhd+"""" : """"+super_params_cpu_uhd+""""
global analyse_params = (gpu>=1) ? """"+analyse_params_gpu_uhd+"""" : """"+analyse_params_cpu_uhd+""""
global smoothfps_params = (gpu>=1) ? """"+smoothfps_params_gpu_uhd+"""" : """"+smoothfps_params_cpu_uhd+""""
""")

function interpolate(clip src)
{
super = SVSuper(src, super_params)
vectors = SVAnalyse(super, analyse_params, src)
SVSmoothFps(src, super, vectors, smoothfps_params, mt=threads)
}

Framerate > 30.5 ? eval("""

""") : z < 2305000 ? eval(""" 
interpolate()
""") : z < 8300000 && uhd == 1 ? eval(""" 
interpolate()
""") : eval("""

""")

sh == 1 ? eval(""" 
Sharpen(0.3)
""") : sh == 2 ? eval(""" 
Sharpen(0.5)
""") : sh == 3 ? eval(""" 
Sharpen(0.7)
""") : eval("""

""")

Prefetch(threads)

# WriteFileStart("params.txt","super_params","chr(10)","analyse_params","chr(10)","smoothfps_params")