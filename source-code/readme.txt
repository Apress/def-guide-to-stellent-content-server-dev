The Definitive Guide To Content Server Development Sample Code
==============================================================

This is the source code for the book. For chapters 3-6, this is simply
text from the book in electronic form. For chapters 7-12, the sample code
is in its fully dunled component form. You can deploy this component, and
begin working on it immediately.

In the Additional Samples folder, you will find additional components and
sample code that you may find interesting. For the most recent versions
of these components, please visit the Stellent Support site.

All of these sampels are offered as-is, with no warrenty. However, we will
certainly do our best to fix any bugs you may find.


Changelog
---------

8/14/06
  Fixed a bug with 'hcst-checkin.hcst' and jsp-checkin.jsp.' The required 
  field 'dInDate' was not present, so I added a hidden field that set it 
  to the current date. Also added the field 'dDocAccount' in case accounts
  are enabled. Also set the flag "MultiUpload=false" to turn off the
  upload applet, if it was enabled.

7/20/06
  ***IMPORTANT***
  Fixed a security hole in the 'SecurityFilter' Java component. Everybody
  using that component as a sample should read the README for that component
  and install the new version.

6/28/06
  First build.


