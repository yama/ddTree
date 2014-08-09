/**
 * ddTree
 *
 * DropDown resource in TVs
 *
 * @category    snippet
 * @version     1.0.2
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @properties
 * @internal    @modx_category Добавленные
 * @internal    @installset base, sample
 *
 * @author      Urique Dertlian <uriq@uniqs.ru>
 * @date        28/02/2008
 * -----------------------------------------------------------------------------
 *   TV: 
 *     -Визуальный компонент - Delimited List (,)
 *     -Возможные значения: @EVAL return $modx->runSnippet('ddTree',array('doc'=>1,'depth'=>6));

 */

 $doc = isset($doc) ? $doc : 0;
$depth = isset($depth) ? $depth: 100;
if(!function_exists("getItems"))
{
 function getItems($p=0, $d=100, $l=0)
 {
  global $modx,$modx_charset;
  ($modx_charset=='UTF-8') ? $nbsp=chr(0xC2).chr(0xA0) : $nbsp=chr(0xA0);
  $c=$modx->getDocumentChildren($p);
  foreach($c as $k)
  {
   $out.=str_repeat($nbsp,$l*5).$k['pagetitle']."==".$k['id']."||";
   if($l<$d) $out.=getItems($k['id'],$d,$l+1);
  }
  return $out;
 }
}
return getItems($doc,$depth);
?>