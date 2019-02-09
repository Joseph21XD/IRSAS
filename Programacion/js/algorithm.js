function getPaging(str)
{
$("#loading-content").load("dataSearch.php?"+str, hideLoader);
}