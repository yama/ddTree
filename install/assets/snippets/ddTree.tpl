/**
 * ddTree
 *
 * DropDown resource in TVs
 *
 * @category    snippet
 * @version     1.0.3
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

if(!isset($doc))   $doc = 0;
if(!isset($depth)) $depth = 100;
if(!isset($type))  $type = 'list';
if(!function_exists("getItems"))
{
  function getItems($p=0, $d=100, $l=0)
  {
    global $modx,$modx_charset,$field_type,$content;
    $nbsp = ($modx_charset=='UTF-8') ? chr(0xC2).chr(0xA0) : chr(0xA0);
    $c=$modx->getDocumentChildren($p);
    $out = array();
    $indent = '';
    foreach($c as $k)
    {
      if($type!=='checkbox') $indent = str_repeat($nbsp,$l*5);
      $out[] = sprintf('%s%s==%s', $indent,$k['pagetitle'],$k['id']);
      if($l<$d&&$k['isfolder']==1) $out[] = getItems($k['id'],$d,$l+1);
    }
    $out = join('||',$out);
    return $out;
  }
}
$out = getItems($doc,$depth);
if($type!=='checkbox') $out = '||'.$out;
return $out;
?>