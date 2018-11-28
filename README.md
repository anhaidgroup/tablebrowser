<div class="section" id="user-manual">
<span id="user"></span><h1>User Manual<a class="headerlink" href="#user-manual" title="Permalink to this headline"></a></h1>
<div class="section" id="overview">
<h2>Overview<a class="headerlink" href="#overview" title="Permalink to this headline"></a></h2>
<p>Cloud browser is a tool for easy visualization of large csv files. This tool allows you to upload csv files and view
them as a map i.e. perform pan and zoom operations through UI. Cloud browser processes csv files on the fly and has a
low latency for initial loading and browsing as compared to traditional tools such as Apple Numbers and Microsoft Excel.
It is available as a micro-cloud service, hence can be hosted in one place and then the users do not need to worry about
any requirements or dependencies other than a web browser.</p>
</div>
<div class="section" id="requirements-summary">
<h2>Requirements Summary<a class="headerlink" href="#requirements-summary" title="Permalink to this headline"></a></h2>
<p>Cloud browser is configured to use a maximum of 30 GB of disk space. This tool has been tested on Ubuntu 16.04 but
should be compatible with other versions. In order to set up cloud browser on a host, a python 3.5.0 or newer environment
will be required which could be native, virtual or a container. Python pip is required for installing dependencies.
Wkhtmltopdf 0.12.3 package needs to be installed on the machine. Write permissions are required on the ‘media’ folder
where temporary data will be stored.</p>
</div>
<div class="section" id="installation">
<h2>Installation<a class="headerlink" href="#installation" title="Permalink to this headline"></a></h2>
<ul>
<li><p class="first">Login to the ec2 console and launch an ec2 instance. We recommend using the m5.large ec2 instance with ubuntu 16.04. The application should work on other instance types but may run slower on the burstable t-series instance types.</p>
</li>
<li><p class="first">When you create the instance, you will get a key pair which you should save to some location on your local machine</p>
</li>
<li><p class="first">Go to the “Network &amp; Security” menu of your ec2 instance. Find the security group that your instance is part of. Click on “Inbound rules”. Use the dropdown and add HTTP (port 80).</p>
</li>
<li><p class="first">Change permissions for the private key</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">chmod</span> <span class="mi">400</span> <span class="o">/</span><span class="n">path_to_key</span><span class="o">/</span><span class="n">my_key</span><span class="o">.</span><span class="n">pem</span>
</pre></div>
</div>
</li>
<li><p class="first">Note the public dns name for your ec2 instance from the ec2 instance dashboard</p>
</li>
<li><p class="first">SSH into your ec2 instance using the downloaded key</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">ssh</span> <span class="o">-</span><span class="n">i</span> <span class="o">/</span><span class="n">path_to_key</span><span class="o">/</span><span class="n">my_key</span><span class="o">.</span><span class="n">pem</span> <span class="n">ec2</span><span class="o">-</span><span class="n">user</span><span class="nd">@public_dns_name</span>
</pre></div>
</div>
</li>
<li><p class="first">Install docker</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">yum</span> <span class="n">install</span> <span class="o">-</span><span class="n">y</span> <span class="n">docker</span>
</pre></div>
</div>
</li>
<li><p class="first">Start Docker service</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">service</span> <span class="n">docker</span> <span class="n">start</span>
</pre></div>
</div>
</li>
<li><p class="first">Run the docker container</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">docker</span> <span class="n">run</span> <span class="o">-</span><span class="n">p</span> <span class="mi">8000</span><span class="p">:</span><span class="mi">8000</span> <span class="n">kaushikc92</span><span class="o">/</span><span class="n">magicktable</span><span class="p">:</span><span class="n">v5</span>
</pre></div>
</div>
</li>
<li><p class="first">Download and run this script for setting up nginx server</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">curl</span> <span class="o">-</span><span class="n">o</span> <span class="n">nginx_settings</span><span class="o">.</span><span class="n">sh</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">raw</span><span class="o">.</span><span class="n">githubusercontent</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">anhaidgroup</span><span class="o">/</span><span class="n">tablebrowser</span><span class="o">/</span><span class="n">master</span><span class="o">/</span><span class="n">nginx_settings</span><span class="o">.</span><span class="n">sh</span>
<span class="n">chmod</span> <span class="o">+</span><span class="n">x</span> <span class="n">nginx_settings</span><span class="o">.</span><span class="n">sh</span>
<span class="n">sudo</span> <span class="o">./</span><span class="n">nginx_settings</span><span class="o">.</span><span class="n">sh</span> <span class="n">public_dns_name</span>
</pre></div>
</div>
</li>
<li><p class="first">You can now use the tool by opening a web browser and typing the public dns name</p>
</li>
<li><p class="first">You can stop (or terminate) the service from the EC2 instance dashboard. Select your EC2 instance, click on “Actions” and then click on stop (or terminate)</p>
</li>
</ul>
</div>
<div class="section" id="usage">
<h2>Usage<a class="headerlink" href="#usage" title="Permalink to this headline"></a></h2>
<p>This tool is pretty straight forward to use. The index page opens up a file manager portal where you can upload a csv
file, choose to browse one of the csv files already uploaded, delete a file or download a file. Clicking on the csv file
will open the file in a map window where you can use pan and zoom operations to browse it. A slider is available to the
right of the map window which can be used to quickly jump to any portion of a large csv file.</p>
</div>
</div>
